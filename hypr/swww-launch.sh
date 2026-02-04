#!/bin/bash

# Kill old daemon if running
pkill swww-daemon

# Start swww daemon
swww-daemon &

# Wait for daemon to start
sleep 1

# Set wallpaper
swww img /home/shannu24/.config/hypr/wallpapers/wallpaper.jpg \
  --transition-type grow \
  --transition-duration 1

