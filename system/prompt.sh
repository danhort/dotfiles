#!/usr/bin/env bash

## Uncomment to disable git info
#POWERLINE_GIT=0

__powerline() {
    # Colorscheme
    readonly COLOR_LIGTH_BLUE='\[\033[1;34m\]'
    readonly RESET='\[\033[m\]'
    readonly COLOR_LIGHT_GREEN='\[\033[1;32m\]'
    readonly COLOR_CYAN='\[\033[0;36m\]'
    readonly COLOR_GREEN='\[\033[0;32m\]'
    readonly COLOR_RED='\[\033[0;31m\]'

    readonly SYMBOL_GIT_MODIFIED='*'
    readonly SYMBOL_GIT_PUSH='↑'
    readonly SYMBOL_GIT_PULL='↓'

    readonly PS_SYMBOL='$'

    __git_info() {
        [[ $POWERLINE_GIT = 0 ]] && return # disabled
        hash git 2>/dev/null || return # git not found
        local git_eng="env LANG=C git"   # force git output in English to make our work easier

        # get current branch name
        local ref=$($git_eng symbolic-ref --short HEAD 2>/dev/null)

        if [[ -n "$ref" ]]; then
            # prepend branch symbol
            ref=[$ref]
        else
            # get tag name or short unique hash
            ref=$($git_eng describe --tags --always 2>/dev/null)
        fi

        [[ -n "$ref" ]] || return  # not a git repo

        local marks

        # scan first two lines of output from `git status`
        while IFS= read -r line; do
            if [[ $line =~ ^## ]]; then # header line
                [[ $line =~ ahead\ ([0-9]+) ]] && marks+=" $SYMBOL_GIT_PUSH${BASH_REMATCH[1]}"
                [[ $line =~ behind\ ([0-9]+) ]] && marks+=" $SYMBOL_GIT_PULL${BASH_REMATCH[1]}"
            else # branch is modified if output contains more lines after the header line
                marks="$SYMBOL_GIT_MODIFIED$marks"
                break
            fi
        done < <($git_eng status --porcelain --branch 2>/dev/null)  # note the space between the two <

        # print the git branch segment without a trailing newline
        printf " $ref$marks"
    }

    ps1() {
        # Check the exit code of the previous command and display different
        # colors in the prompt accordingly.
        if [ $? -eq 0 ]; then
            local symbol="$COLOR_GREEN $PS_SYMBOL $RESET"
        else
            local symbol="$COLOR_RED $PS_SYMBOL $RESET"
        fi

        local cwd="$COLOR_LIGTH_BLUE\u$RESET$COLOR_RED@$RESET$COLOR_LIGTH_BLUE\h $COLOR_LIGHT_GREEN\w$RESET"
        # Bash by default expands the content of PS1 unless promptvars is disabled.
        # We must use another layer of reference to prevent expanding any user
        # provided strings, which would cause security issues.
        # POC: https://github.com/njhartwell/pw3nage
        # Related fix in git-bash: https://github.com/git/git/blob/9d77b0405ce6b471cb5ce3a904368fc25e55643d/contrib/completion/git-prompt.sh#L324
        if shopt -q promptvars; then
            __powerline_git_info="$(__git_info)"
            local git="$COLOR_CYAN\${__powerline_git_info}$RESET"
        else
            # promptvars is disabled. Avoid creating unnecessary env var.
            local git="$COLOR_CYAN$(__git_info)$RESET"
        fi

        PS1="$cwd$git$symbol"
    }

    PROMPT_COMMAND="ps1${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
}

__powerline
unset __powerline
