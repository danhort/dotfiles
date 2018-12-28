#!/usr/bin/env bash

# increase max file watch
echo "-- Increasing file watches --"
sed -i '/fs.inotify.max_user_watches/d' /etc/sysctl.conf
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
sysctl -p