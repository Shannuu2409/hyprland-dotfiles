#!/usr/bin/env bash

# Hyprland Theme Switcher
# A comprehensive theme switcher for Hyprland with preset themes and wallpaper-based theming

THEME_DIR="$HOME/.config/hypr/themes"
CURRENT_THEME_DIR="$HOME/.config/hypr/current-theme"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
SCRIPTS_DIR="$HOME/.config/hypr/scripts"

# Ensure directories exist
mkdir -p "$THEME_DIR" "$CURRENT_THEME_DIR"

# Function to display theme menu
show_theme_menu() {
    local themes=()
    
    # Add preset themes
    if [ -d "$THEME_DIR" ]; then
        for theme in "$THEME_DIR"/*; do
            if [ -d "$theme" ]; then
                themes+=("$(basename "$theme")")
            fi
        done
    fi
    
    # Add special options
    themes+=("───────────────────")
    themes+=("🎨 Pick Wallpaper...")
    themes+=("🖼️  Wallpaper-based Theme")
    
    # Display menu with wofi
    printf '%s\n' "${themes[@]}" | wofi \
        --dmenu \
        --prompt "Select Theme" \
        --width 400 \
        --height 500 \
        --style "$HOME/.config/wofi/theme-menu.css" \
        --insensitive
}

# Function to apply preset theme
apply_preset_theme() {
    local theme_name="$1"
    local theme_path="$THEME_DIR/$theme_name"
    
    if [ ! -d "$theme_path" ]; then
        notify-send "Theme Error" "Theme '$theme_name' not found"
        return 1
    fi
    
    # Copy theme files to current theme directory
    [ -f "$theme_path/colors.conf" ] && cp "$theme_path/colors.conf" "$CURRENT_THEME_DIR/colors.conf"
    [ -f "$theme_path/waybar.css" ] && cp "$theme_path/waybar.css" "$HOME/.config/waybar/colors.css"
    [ -f "$theme_path/wofi.css" ] && cp "$theme_path/wofi.css" "$HOME/.config/wofi/colors.css"
    [ -f "$theme_path/kitty.conf" ] && cp "$theme_path/kitty.conf" "$HOME/.config/kitty/colors.conf"
    
    # Set wallpaper if exists
    if [ -f "$theme_path/wallpaper.jpg" ] || [ -f "$theme_path/wallpaper.png" ]; then
        local wallpaper=$(find "$theme_path" -name "wallpaper.*" | head -n 1)
        cp "$wallpaper" "$CURRENT_THEME_DIR/wallpaper"
        swww img "$wallpaper" --transition-type fade --transition-duration 2
    fi
    
    # Apply GTK theme if specified
    if [ -f "$theme_path/gtk.conf" ]; then
        "$SCRIPTS_DIR/apply-gtk-theme.sh" "$(cat "$theme_path/gtk.conf")"
    fi
    
    # Save current theme name
    echo "$theme_name" > "$CURRENT_THEME_DIR/theme-name"
    
    # Reload applications
    "$SCRIPTS_DIR/reload-theme.sh"
    
    notify-send "Theme Applied" "Successfully applied '$theme_name' theme"
}

# Function to apply wallpaper-based theme
apply_wallpaper_theme() {
    local wallpaper="$1"
    
    if [ ! -f "$wallpaper" ]; then
        notify-send "Wallpaper Error" "Wallpaper file not found"
        return 1
    fi
    
    # Run wallust to generate colors
    wallust run "$wallpaper"
    
    # Copy wallust-generated colors to current theme
    [ -f "$HOME/.config/hypr/border.conf" ] && cp "$HOME/.config/hypr/border.conf" "$CURRENT_THEME_DIR/colors.conf"
    
    # Save wallpaper
    cp "$wallpaper" "$CURRENT_THEME_DIR/wallpaper"
    swww img "$wallpaper" --transition-type fade --transition-duration 2
    
    # Save theme type
    echo "wallpaper-based" > "$CURRENT_THEME_DIR/theme-name"
    
    # Reload applications
    "$SCRIPTS_DIR/reload-theme.sh"
    
    notify-send "Theme Applied" "Generated theme from wallpaper"
}

# Function to pick wallpaper
pick_wallpaper() {
    if [ ! -d "$WALLPAPER_DIR" ]; then
        notify-send "Wallpaper Error" "Wallpaper directory not found: $WALLPAPER_DIR"
        return 1
    fi
    
    # Find all image files
    local wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | \
        sed "s|$WALLPAPER_DIR/||" | \
        wofi --dmenu --prompt "Select Wallpaper" --width 600 --height 500)
    
    if [ -n "$wallpaper" ]; then
        apply_wallpaper_theme "$WALLPAPER_DIR/$wallpaper"
    fi
}

# Main logic
main() {
    local selection=$(show_theme_menu)
    
    case "$selection" in
        "")
            # User cancelled
            exit 0
            ;;
        "───────────────────")
            # Separator selected, ignore
            exit 0
            ;;
        "🎨 Pick Wallpaper...")
            pick_wallpaper
            ;;
        "🖼️  Wallpaper-based Theme")
            # Use current wallpaper or last wallpaper
            if [ -f "$CURRENT_THEME_DIR/wallpaper" ]; then
                apply_wallpaper_theme "$CURRENT_THEME_DIR/wallpaper"
            else
                pick_wallpaper
            fi
            ;;
        *)
            # Preset theme selected
            apply_preset_theme "$selection"
            ;;
    esac
}

main "$@"
