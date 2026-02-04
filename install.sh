#!/bin/bash

# saneAspect Noir - Installation Script
# Automatically install and configure the monochromatic Hyprland theme

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_header() {
    echo -e "${BLUE}=====================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}=====================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Backup existing configurations
backup_configs() {
    print_header "Backing up existing configurations"

    BACKUP_DIR="$HOME/.config/hyprland-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP_DIR"

    [ -d "$HOME/.config/hypr" ] && cp -r "$HOME/.config/hypr" "$BACKUP_DIR/" && print_success "Backed up hypr"
    [ -d "$HOME/.config/waybar" ] && cp -r "$HOME/.config/waybar" "$BACKUP_DIR/" && print_success "Backed up waybar"
    [ -d "$HOME/.config/kitty" ] && cp -r "$HOME/.config/kitty" "$BACKUP_DIR/" && print_success "Backed up kitty"
    [ -d "$HOME/.config/wofi" ] && cp -r "$HOME/.config/wofi" "$BACKUP_DIR/" && print_success "Backed up wofi"
    [ -d "$HOME/.config/dunst" ] && cp -r "$HOME/.config/dunst" "$BACKUP_DIR/" && print_success "Backed up dunst"

    print_success "Backups saved to: $BACKUP_DIR"
}

# Install required packages (Arch Linux)
install_packages() {
    print_header "Installing required packages"

    if command -v pacman &> /dev/null; then
        print_warning "Detected Arch Linux. Installing packages..."
        sudo pacman -S --needed --noconfirm \
            hyprland \
            waybar \
            kitty \
            wofi \
            dunst \
            swww \
            ttf-jetbrains-mono-nerd \
            grim \
            slurp \
            wl-clipboard \
            brightnessctl \
            playerctl \
            pavucontrol \
            network-manager-applet \
            blueman
        print_success "Packages installed"
    else
        print_warning "Non-Arch system detected. Please install packages manually:"
        echo "  - hyprland, waybar, kitty, wofi, dunst, swww"
        echo "  - JetBrainsMono Nerd Font"
        echo "  - grim, slurp, wl-clipboard, brightnessctl, playerctl, network-manager-applet, blueman"
        read -p "Press Enter to continue after installing packages..."
    fi
}

# Copy configuration files
copy_configs() {
    print_header "Installing configuration files"

    # Get script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # Create config directories
    mkdir -p "$HOME/.config/hypr/config"
    mkdir -p "$HOME/.config/waybar/scripts"
    mkdir -p "$HOME/.config/kitty"
    mkdir -p "$HOME/.config/wofi"
    mkdir -p "$HOME/.config/dunst"
    mkdir -p "$HOME/.config/hypr/wallpapers"

    # Hyprland: main config + split configs
    cp "$SCRIPT_DIR/hypr/hyprland.conf" "$HOME/.config/hypr/" && print_success "Installed hyprland.conf"
    for f in monitors variables autostart env input general decoration animations layouts gestures misc windowrules keybinds; do
        [ -f "$SCRIPT_DIR/hypr/config/${f}.conf" ] && cp "$SCRIPT_DIR/hypr/config/${f}.conf" "$HOME/.config/hypr/config/" && print_success "Installed hypr/config/${f}.conf"
    done
    cp "$SCRIPT_DIR/hypr/swww-launch.sh" "$HOME/.config/hypr/" && print_success "Installed swww-launch.sh"
    cp "$SCRIPT_DIR/hypr/swww.conf" "$HOME/.config/hypr/" 2>/dev/null && print_success "Installed swww.conf" || true
    [ -f "$SCRIPT_DIR/hypr/wallpapers/wallpaper.jpg" ] && cp "$SCRIPT_DIR/hypr/wallpapers/wallpaper.jpg" "$HOME/.config/hypr/wallpapers/" && print_success "Installed default wallpaper"
    sed -i "s|/home/shannu24|$HOME|g" "$HOME/.config/hypr/swww-launch.sh" 2>/dev/null || true
    chmod +x "$HOME/.config/hypr/swww-launch.sh" && print_success "swww-launch.sh executable"

    # Waybar: config, style, and all JSON modules + scripts
    cp "$SCRIPT_DIR/waybar/config" "$HOME/.config/waybar/" 2>/dev/null && print_success "Installed waybar config" || true
    [ -f "$SCRIPT_DIR/waybar/config.jsonc" ] && cp "$SCRIPT_DIR/waybar/config.jsonc" "$HOME/.config/waybar/" && print_success "Installed waybar config.jsonc"
    cp "$SCRIPT_DIR/waybar/style.css" "$HOME/.config/waybar/" && print_success "Installed waybar style.css"
    for j in modules quicklinks hardware media sound audio-switch; do
        [ -f "$SCRIPT_DIR/waybar/${j}.json" ] && cp "$SCRIPT_DIR/waybar/${j}.json" "$HOME/.config/waybar/" && print_success "Installed waybar/${j}.json"
    done
    for s in audio-output-icon.sh vpn-status.sh vpn-toggle.sh; do
        [ -f "$SCRIPT_DIR/waybar/scripts/$s" ] && cp "$SCRIPT_DIR/waybar/scripts/$s" "$HOME/.config/waybar/scripts/" && chmod +x "$HOME/.config/waybar/scripts/$s" && print_success "Installed waybar/scripts/$s"
    done

    # Kitty, Wofi, Dunst
    cp "$SCRIPT_DIR/kitty/kitty.conf" "$HOME/.config/kitty/" && print_success "Installed kitty.conf"
    cp "$SCRIPT_DIR/wofi/config" "$HOME/.config/wofi/" && print_success "Installed wofi config"
    cp "$SCRIPT_DIR/wofi/style.css" "$HOME/.config/wofi/" && print_success "Installed wofi style.css"
    [ -f "$SCRIPT_DIR/wofi/colors.css" ] && cp "$SCRIPT_DIR/wofi/colors.css" "$HOME/.config/wofi/" && print_success "Installed wofi colors.css"
    cp "$SCRIPT_DIR/dunst/dunstrc" "$HOME/.config/dunst/" && print_success "Installed dunstrc"

    print_success "All configuration files installed"
}

# Install Spicetify theme
install_spicetify() {
    print_header "Installing Spicetify theme (optional)"

    read -p "Do you want to install the Spotify theme? (y/N): " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command -v spicetify &> /dev/null; then
            SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
            mkdir -p "$HOME/.config/spicetify/Themes/Sleek"
            cp "$SCRIPT_DIR/spicetify/Themes/Sleek/color.ini" "$HOME/.config/spicetify/Themes/Sleek/"

            spicetify config current_theme Sleek
            spicetify config color_scheme saneAspect-noir
            spicetify apply

            print_success "Spicetify theme installed"
        else
            print_warning "Spicetify not found. Install it first:"
            echo "  curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh"
        fi
    else
        print_warning "Skipped Spicetify installation"
    fi
}

# Setup wallpaper directory
setup_wallpaper() {
    print_header "Setting up wallpaper directory"

    mkdir -p "$HOME/.config/hypr/wallpapers"

    print_warning "Place your wallpaper in: $HOME/.config/hypr/wallpapers/"
    print_warning "Default script uses: wallpaper.jpg (edit ~/.config/hypr/swww-launch.sh to change)"

    echo ""
    print_warning "For a true noir aesthetic, use:"
    echo "  - Pure black solid color wallpaper"
    echo "  - Black and white photography"
    echo "  - Minimalist monochrome artwork"
}

# Verify font installation
verify_fonts() {
    print_header "Verifying font installation"

    if fc-list | grep -i "jetbrains" &> /dev/null; then
        print_success "JetBrainsMono Nerd Font is installed"
    else
        print_error "JetBrainsMono Nerd Font not found!"
        print_warning "Download from: https://www.nerdfonts.com/"
        print_warning "Or install with: sudo pacman -S ttf-jetbrains-mono-nerd"
    fi

    # Rebuild font cache
    fc-cache -fv &> /dev/null
    print_success "Font cache rebuilt"
}

# Optional: apply GTK dark theme and Qt platform theme
setup_gtk_theme() {
    print_header "GTK / Qt theme (optional)"

    read -p "Apply dark GTK theme via gsettings and remind about Qt? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command -v gsettings &> /dev/null; then
            gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null && print_success "Set color-scheme prefer-dark" || true
            gsettings set org.gnome.desktop.interface gtk-theme 'Adw-dark' 2>/dev/null && print_success "Set gtk-theme Adw-dark" || true
            gsettings set org.gnome.desktop.interface cursor-size 24 2>/dev/null && print_success "Set cursor size 24" || true
        else
            print_warning "gsettings not found (install glib2 or run on a GNOME session for gsettings)"
        fi
        print_warning "For Qt apps: install qt6ct and run 'qt6ct' to set a dark style (env is already set in hypr env.conf)"
        print_warning "For more GTK themes see README.md (adw-gtk3, Orchis, Catppuccin, etc.)"
    else
        print_warning "Skipped. You can set dark theme later: see README.md Pre-Installation / GTK Settings"
    fi
}

# Final instructions
show_final_instructions() {
    print_header "Installation Complete!"

    echo ""
    print_success "saneAspect Noir theme has been installed"
    echo ""
    echo "File locations:"
    echo "  Hyprland main:    ~/.config/hypr/hyprland.conf"
    echo "  Hyprland split:   ~/.config/hypr/config/*.conf"
    echo "  Wallpaper script: ~/.config/hypr/swww-launch.sh"
    echo "  Waybar:           ~/.config/waybar/ (config or config.jsonc, style.css, scripts/)"
    echo "  Kitty:            ~/.config/kitty/kitty.conf"
    echo "  Wofi:             ~/.config/wofi/config, style.css"
    echo "  Dunst:            ~/.config/dunst/dunstrc"
    echo ""
    echo "Next steps:"
    echo "  1. Log out and select Hyprland from your display manager"
    echo "  2. Or reload Hyprland with: Super + Shift + C"
    echo "  3. Wallpaper: add image to ~/.config/hypr/wallpapers/ (default: wallpaper.jpg)"
    echo ""
    echo "Keybindings:"
    echo "  Super + Return     : Open terminal (Kitty)"
    echo "  Super + Space      : Open app launcher (Wofi)"
    echo "  Super + Q          : Close window"
    echo "  Super + B          : Open browser"
    echo "  Super + 1-9        : Switch workspace"
    echo "  Super + Shift + C  : Reload Hyprland config"
    echo ""
    echo "Customization:"
    echo "  - Hyprland: ~/.config/hypr/hyprland.conf and ~/.config/hypr/config/*.conf"
    echo "  - Waybar:  ~/.config/waybar/style.css"
    echo "  - Kitty:   ~/.config/kitty/kitty.conf"
    echo ""
    print_success "Enjoy your monochromatic desktop!"
    echo ""
}

# Main installation flow
main() {
    print_header "saneAspect Noir - Hyprland Theme Installer"
    echo ""
    echo "This script will install a monochromatic dark theme for Hyprland"
    echo ""
    read -p "Continue with installation? (y/N): " -n 1 -r
    echo ""

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_error "Installation cancelled"
        exit 1
    fi

    backup_configs
    install_packages
    copy_configs
    verify_fonts
    setup_wallpaper
    setup_gtk_theme
    install_spicetify
    show_final_instructions
}

# Run main function
main
