#!/usr/bin/env bash

# Reload all themed applications after theme change

# Reload Hyprland configuration
hyprctl reload

# Restart waybar
if pgrep -x waybar > /dev/null; then
    killall waybar
    sleep 0.5
    waybar &
fi

# Reload kitty terminals (send SIGUSR1 to reload config)
if pgrep -x kitty > /dev/null; then
    killall -SIGUSR1 kitty
fi

# Apply GTK theme
if [ -x "$HOME/.config/hypr/scripts/apply-gtk-theme.sh" ]; then
    "$HOME/.config/hypr/scripts/apply-gtk-theme.sh"
fi

# Notify user
notify-send "Theme Reloaded" "All applications updated with new theme"
