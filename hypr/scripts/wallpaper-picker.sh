#!/usr/bin/env bash

# Wallpaper picker using wofi
# Allows user to select a wallpaper and applies wallust-based theming

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers
SCRIPTS_DIR="$HOME/.config/hypr/scripts"

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Find all image files and display in wofi
wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | \
    sed "s|$WALLPAPER_DIR/||" | \
    wofi --dmenu --prompt "Select Wallpaper" --width 600 --height 500 --insensitive)

# If user selected a wallpaper
if [ -n "$wallpaper" ]; then
    WALLPAPER_PATH="$WALLPAPER_DIR/$wallpaper"
    
    # Run wallust to generate colors
    wallust run "$WALLPAPER_PATH"
    
    # Set wallpaper
    swww img "$WALLPAPER_PATH" --transition-type fade --transition-duration 2
    
    # Copy wallpaper to current theme
    CURRENT_THEME_DIR="$HOME/.config/hypr/current-theme"
    mkdir -p "$CURRENT_THEME_DIR"
    cp "$WALLPAPER_PATH" "$CURRENT_THEME_DIR/wallpaper"
    
    # Copy generated border colors to current theme
    if [ -f "$HOME/.config/hypr/border.conf" ]; then
        cp "$HOME/.config/hypr/border.conf" "$CURRENT_THEME_DIR/colors.conf"
    fi
    
    # Mark as wallpaper-based theme
    echo "wallpaper-based" > "$CURRENT_THEME_DIR/theme-name"
    
    # Reload theme
    "$SCRIPTS_DIR/reload-theme.sh"
    
    notify-send "Wallpaper Applied" "Theme generated from wallpaper"
fi
