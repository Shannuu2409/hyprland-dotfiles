# Hyprland Theme Switcher - User Guide

## 🎨 Overview

Your Hyprland setup now includes a comprehensive theme switcher that allows you to:
- **Switch between 5 preset themes** with a single keypress
- **Generate themes from wallpapers** using wallust
- **Unified theming** across all components (Hyprland, waybar, wofi, kitty, GTK)

## 🚀 Quick Start

### Activate the Theme Switcher

Press **`SUPER + SHIFT + T`** to open the theme switcher menu.

### Available Options

1. **Preset Themes** (select any):
   - `nord` - Cool blue/gray Nordic palette
   - `catppuccin-mocha` - Warm pastel dark theme (default)
   - `gruvbox-dark` - Retro warm colors
   - `tokyo-night` - Purple/blue cyberpunk aesthetic
   - `dracula` - Purple/pink vampire theme

2. **🎨 Pick Wallpaper...** - Browse and select a wallpaper, automatically generate matching colors

3. **🖼️ Wallpaper-based Theme** - Re-apply colors from your current wallpaper

## 📁 Directory Structure

```
~/.config/hypr/
├── scripts/
│   ├── theme-switcher.sh       # Main theme switcher
│   ├── reload-theme.sh          # Reloads all themed apps
│   ├── apply-gtk-theme.sh       # Applies GTK themes
│   ├── wallpaper-picker.sh      # Wallpaper picker with theming
│   └── init-theme-switcher.sh   # Initialization script
├── themes/
│   ├── nord/
│   ├── catppuccin-mocha/
│   ├── gruvbox-dark/
│   ├── tokyo-night/
│   └── dracula/
└── current-theme/               # Active theme files
    ├── colors.conf              # Current Hyprland colors
    ├── wallpaper                # Current wallpaper
    └── theme-name               # Current theme name
```

## 🎯 What Gets Themed

When you switch themes, the following components update automatically:

- **Hyprland** - Window border colors (active/inactive)
- **Waybar** - Status bar colors and accents
- **Wofi** - Application launcher colors
- **Kitty** - Terminal color scheme (16 colors)
- **GTK** - GTK3/GTK4 application themes

## 🔧 Customization

### Adding Your Own Theme

1. Create a new directory in `~/.config/hypr/themes/your-theme-name/`
2. Add these files:
   - `colors.conf` - Hyprland border colors
   - `waybar.css` - Waybar color definitions
   - `wofi.css` - Wofi color variables
   - `kitty.conf` - Kitty terminal colors
   - `gtk.conf` - GTK theme name (one line)
   - `wallpaper.jpg` or `wallpaper.png` (optional)

3. Use existing themes as templates

### Changing Wallpaper Directory

Edit `~/.config/hypr/scripts/theme-switcher.sh` and change:
```bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
```

### Changing Keybinding

Edit `~/.config/hypr/config/keybinds.conf` and modify:
```conf
bind = $mainMod SHIFT, T, exec, ~/.config/hypr/scripts/theme-switcher.sh
```

## 🐛 Troubleshooting

### Theme not applying?
1. Check if scripts are executable: `ls -l ~/.config/hypr/scripts/`
2. Run manually: `~/.config/hypr/scripts/theme-switcher.sh`
3. Check Hyprland logs: `hyprctl reload`

### Waybar not updating?
- Waybar should restart automatically
- Manual restart: `killall waybar && waybar &`

### Kitty colors not changing?
- Kitty reloads on SIGUSR1 signal (automatic)
- Open a new kitty window to see changes
- Manual reload: `killall -SIGUSR1 kitty`

### Wallust not working?
- Ensure wallust is installed: Check your existing wallust setup
- Check wallust config: `~/.config/wallust/wallust.toml`

## 📝 Technical Details

### How It Works

1. **Preset Themes**: Theme files are copied from `~/.config/hypr/themes/[theme-name]/` to their respective locations
2. **Wallpaper Themes**: Wallust generates colors from the wallpaper and creates theme files
3. **Dynamic Loading**: Hyprland sources `~/.config/hypr/current-theme/colors.conf` which overrides default colors
4. **Application Reload**: After theme switch, waybar restarts and kitty receives reload signal

### Integration with Wallust

Your existing wallust configuration at `~/.config/wallust/wallust.toml` is fully integrated. When you select "Pick Wallpaper..." or "Wallpaper-based Theme", wallust generates colors and the theme switcher applies them.

## 🎉 Enjoy Your Themed Desktop!

Press **`SUPER + SHIFT + T`** anytime to switch themes!
