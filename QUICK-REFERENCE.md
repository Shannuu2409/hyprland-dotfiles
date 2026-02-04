# saneAspect Noir - Quick Reference Card

## Installation
```bash
chmod +x install.sh && ./install.sh
```

## File Locations
```
~/.config/hypr/hyprland.conf          # Main config
~/.config/waybar/config & style.css   # Status bar
~/.config/kitty/kitty.conf            # Terminal
~/.config/wofi/config & style.css     # Launcher
~/.config/dunst/dunstrc               # Notifications
```

## Essential Keybindings

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `Super + Return` | Terminal | `Super + D` | Launcher |
| `Super + Q` | Close window | `Super + V` | Toggle float |
| `Super + F` | Fullscreen | `Super + Shift + C` | Reload config |
| `Super + 1-9` | Workspace | `Super + Shift + 1-9` | Move to workspace |
| `Super + Arrows` | Move focus | `Super + Shift + Arrows` | Move window |
| `Super + A` | Resize mode | `Print` | Screenshot |

## Color Palette
```
#000000  Pure Black       (background)
#080808  Dark Charcoal    (sidebar)
#111111  Darker Grey      (elevated)
#333333  Border Grey      (inactive)
#ffffff  Pure White       (active, text)
```

## Quick Customization

### Adjust Blur
**File**: `~/.config/hypr/hyprland.conf`
```conf
decoration {
    blur {
        size = 12        # 8=light, 12=heavy, 16=max
        passes = 4       # 2=fast, 4=balanced, 6=smooth
    }
}
```

### Change Opacity
**Waybar**: `~/.config/waybar/style.css`
```css
background-color: rgba(0, 0, 0, 0.7);  /* 0.5-0.9 */
```

**Terminal**: `~/.config/hypr/hyprland.conf`
```conf
windowrulev2 = opacity 0.8 0.8, class:^(kitty)$
```

### Adjust Gaps
**File**: `~/.config/hypr/hyprland.conf`
```conf
general {
    gaps_in = 5      # Between windows
    gaps_out = 10    # From edges
    rounding = 10    # Corner radius
}
```

## Common Issues

| Problem | Solution |
|---------|----------|
| Waybar not blurry | Check `layerrule = blur, waybar` in hyprland.conf |
| Wrong font | Install: `ttf-jetbrains-mono-nerd` |
| Blur too slow | Reduce: `size = 8, passes = 2` |
| No wallpaper | Check path in `hyprpaper.conf` |

## Commands

```bash
# Reload Hyprland
hyprctl reload

# Restart Waybar
killall waybar && waybar &

# Check window class
hyprctl clients | grep class

# View logs
cat /tmp/hypr/*/hyprland.log

# Rebuild fonts
fc-cache -fv
```

## Window Rules Template
```conf
# Opacity
windowrulev2 = opacity 0.8 0.8, class:^(APP_NAME)$

# Floating
windowrulev2 = float, class:^(APP_NAME)$

# Workspace
windowrulev2 = workspace 2, class:^(APP_NAME)$

# Size
windowrulev2 = size 800 600, class:^(APP_NAME)$
```

## Blur Performance Presets

**High Performance**:
```conf
size = 8, passes = 2
```

**Balanced** (default):
```conf
size = 12, passes = 4
```

**Maximum Quality**:
```conf
size = 16, passes = 6
```

## Waybar Module Quick Edit

**File**: `~/.config/waybar/config`

Add/remove modules:
```json
"modules-left": ["hyprland/workspaces", "hyprland/window"],
"modules-center": ["clock"],
"modules-right": ["pulseaudio", "network", "cpu", "memory", "battery", "tray"]
```

## Create Solid Black Wallpaper
```bash
convert -size 1920x1080 xc:black ~/.config/hypr/wallpapers/noir-wallpaper.png
```

## Links
- Config Guide: `CONFIGURATION-GUIDE.md`
- Wallpaper Guide: `WALLPAPER-GUIDE.md`
- Full README: `README.md`
- Hyprland Wiki: https://wiki.hyprland.org/

---

**Print this page for offline reference!**
