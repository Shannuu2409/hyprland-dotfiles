#!/usr/bin/env bash

# Initialize theme switcher with Catppuccin Mocha as default theme

THEME_DIR="$HOME/.config/hypr/themes"
CURRENT_THEME_DIR="$HOME/.config/hypr/current-theme"
SCRIPTS_DIR="$HOME/.config/hypr/scripts"

# Make all scripts executable
chmod +x "$SCRIPTS_DIR/theme-switcher.sh"
chmod +x "$SCRIPTS_DIR/reload-theme.sh"
chmod +x "$SCRIPTS_DIR/apply-gtk-theme.sh"
chmod +x "$SCRIPTS_DIR/wallpaper-picker.sh"

# Create current-theme directory if it doesn't exist
mkdir -p "$CURRENT_THEME_DIR"

# Set Catppuccin Mocha as default theme
DEFAULT_THEME="catppuccin-mocha"

if [ -d "$THEME_DIR/$DEFAULT_THEME" ]; then
    echo "Setting up default theme: $DEFAULT_THEME"
    
    # Copy theme files
    cp "$THEME_DIR/$DEFAULT_THEME/colors.conf" "$CURRENT_THEME_DIR/colors.conf"
    cp "$THEME_DIR/$DEFAULT_THEME/waybar.css" "$HOME/.config/waybar/colors.css"
    cp "$THEME_DIR/$DEFAULT_THEME/wofi.css" "$HOME/.config/wofi/colors.css"
    cp "$THEME_DIR/$DEFAULT_THEME/kitty.conf" "$HOME/.config/kitty/colors.conf"
    
    # Save theme name
    echo "$DEFAULT_THEME" > "$CURRENT_THEME_DIR/theme-name"
    
    echo "✓ Default theme applied successfully!"
    echo "✓ Scripts made executable"
    echo ""
    echo "Theme switcher is ready!"
    echo "Press SUPER+SHIFT+T to open the theme switcher"
else
    echo "Error: Default theme not found at $THEME_DIR/$DEFAULT_THEME"
    exit 1
fi
