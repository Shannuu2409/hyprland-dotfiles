#!/usr/bin/env bash

# Apply GTK theme settings
# Can accept theme name as argument or read from current-theme

CURRENT_THEME_DIR="$HOME/.config/hypr/current-theme"

# If theme name provided as argument, use it
if [ -n "$1" ]; then
    GTK_THEME="$1"
else
    # Try to read from gtk.conf in current theme
    if [ -f "$CURRENT_THEME_DIR/gtk-theme-name" ]; then
        GTK_THEME=$(cat "$CURRENT_THEME_DIR/gtk-theme-name")
    else
        # Default GTK theme
        GTK_THEME="Adwaita-dark"
    fi
fi

# Apply GTK3 and GTK4 theme using gsettings
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME" 2>/dev/null
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null

# Update GTK3 settings.ini
GTK3_CONFIG="$HOME/.config/gtk-3.0/settings.ini"
if [ -f "$GTK3_CONFIG" ]; then
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$GTK_THEME/" "$GTK3_CONFIG"
else
    mkdir -p "$HOME/.config/gtk-3.0"
    cat > "$GTK3_CONFIG" << EOF
[Settings]
gtk-theme-name=$GTK_THEME
gtk-application-prefer-dark-theme=1
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Sans 10
EOF
fi

# Update GTK4 settings.ini
GTK4_CONFIG="$HOME/.config/gtk-4.0/settings.ini"
if [ -f "$GTK4_CONFIG" ]; then
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$GTK_THEME/" "$GTK4_CONFIG"
else
    mkdir -p "$HOME/.config/gtk-4.0"
    cat > "$GTK4_CONFIG" << EOF
[Settings]
gtk-theme-name=$GTK_THEME
gtk-application-prefer-dark-theme=1
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Sans 10
EOF
fi
