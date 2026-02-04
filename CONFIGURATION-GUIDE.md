# saneAspect Noir - Detailed Configuration Guide

## Table of Contents
1. [Quick Start](#quick-start)
2. [File Structure Explained](#file-structure-explained)
3. [Customization Guide](#customization-guide)
4. [Blur Settings Deep Dive](#blur-settings-deep-dive)
5. [Window Rules Reference](#window-rules-reference)
6. [Keybindings Reference](#keybindings-reference)
7. [Troubleshooting](#troubleshooting)

---

## Quick Start

### Automated Installation
```bash
cd linux-configs
chmod +x install.sh
./install.sh
```

### Manual Installation
```bash
# Backup existing configs
cp -r ~/.config/hypr ~/.config/hypr.backup
cp -r ~/.config/waybar ~/.config/waybar.backup

# Copy new configs
cp -r linux-configs/hypr ~/.config/
cp -r linux-configs/waybar ~/.config/
cp -r linux-configs/kitty ~/.config/
cp -r linux-configs/wofi ~/.config/
cp -r linux-configs/dunst ~/.config/

# Reload Hyprland
hyprctl reload
```

---

## File Structure Explained

```
~/.config/
├── hypr/
│   ├── hyprland.conf       # Main Hyprland configuration
│   ├── hyprpaper.conf      # Wallpaper manager settings
│   └── wallpapers/         # Store your wallpapers here
│       └── noir-wallpaper.png
│
├── waybar/
│   ├── config              # Waybar modules and layout (JSON)
│   └── style.css           # Waybar appearance (CSS)
│
├── kitty/
│   └── kitty.conf          # Terminal configuration
│
├── wofi/
│   ├── config              # Launcher behavior settings
│   └── style.css           # Launcher appearance
│
└── dunst/
    └── dunstrc             # Notification daemon settings
```

### What Each File Does

#### `hyprland.conf`
- **General section**: Window gaps, borders, layouts
- **Decoration section**: Blur, rounding, shadows, opacity
- **Animations section**: Window animations and transitions
- **Window rules**: Auto-transparency, floating windows, workspace assignments
- **Keybindings**: All keyboard shortcuts

#### `waybar/config`
- **Modules**: Which widgets to show (workspaces, clock, CPU, etc.)
- **Layout**: Left, center, right positioning
- **Behavior**: Update intervals, click actions

#### `waybar/style.css`
- **Appearance**: Colors, fonts, borders
- **Glassmorphism**: Transparency and blur effects
- **Hover states**: Interactive visual feedback

#### `kitty.conf`
- **Color scheme**: Monochromatic terminal colors
- **Opacity**: Background transparency (0.8)
- **Fonts**: JetBrainsMono configuration
- **Keybindings**: Terminal-specific shortcuts

#### `wofi/config` + `wofi/style.css`
- **Launcher appearance**: Matching glassmorphism style
- **Search behavior**: Fuzzy matching, filtering
- **Size and position**: Center screen, 600x400

#### `dunstrc`
- **Notification appearance**: Matching theme aesthetics
- **Positioning**: Top-right corner
- **Urgency levels**: Different styles for low/normal/critical

---

## Customization Guide

### Adjusting Blur Intensity

**Location**: `~/.config/hypr/hyprland.conf`

```conf
decoration {
    blur {
        size = 12        # Change this: 8 (light) to 16 (very heavy)
        passes = 4       # Change this: 1 (fast) to 6 (smooth)
    }
}
```

**Recommendations**:
- **Light blur**: `size = 8, passes = 2`
- **Medium blur**: `size = 10, passes = 3`
- **Heavy blur** (default): `size = 12, passes = 4`
- **Maximum blur**: `size = 16, passes = 6`

### Adjusting Opacity

**Waybar opacity** (`~/.config/waybar/style.css`):
```css
window#waybar {
    background-color: rgba(0, 0, 0, 0.7);  /* Change 0.7 to 0.5-0.9 */
}
```

**Terminal opacity** (`~/.config/hypr/hyprland.conf`):
```conf
windowrulev2 = opacity 0.8 0.8, class:^(kitty)$  # Change 0.8 to 0.6-0.95
```

**All windows opacity**:
```conf
decoration {
    active_opacity = 1.0      # Active window (1.0 = fully opaque)
    inactive_opacity = 0.95   # Inactive windows
}
```

### Changing Border Colors

**Location**: `~/.config/hypr/hyprland.conf`

```conf
general {
    col.active_border = rgb(ffffff)    # Pure white
    col.inactive_border = rgb(333333)  # Dark grey
}
```

**Alternative color schemes**:
```conf
# Softer contrast
col.active_border = rgb(cccccc)
col.inactive_border = rgb(444444)

# Higher contrast
col.active_border = rgb(ffffff)
col.inactive_border = rgb(111111)

# Inverted (dark active, light inactive)
col.active_border = rgb(666666)
col.inactive_border = rgb(aaaaaa)
```

### Adjusting Gaps and Rounding

**Location**: `~/.config/hypr/hyprland.conf`

```conf
general {
    gaps_in = 5     # Gaps between windows
    gaps_out = 10   # Gaps from screen edges
    rounding = 10   # Corner radius
}
```

**Presets**:
```conf
# Minimal gaps
gaps_in = 2
gaps_out = 5
rounding = 5

# Moderate (default)
gaps_in = 5
gaps_out = 10
rounding = 10

# Spacious
gaps_in = 10
gaps_out = 20
rounding = 15
```

### Waybar Positioning

**Location**: `~/.config/waybar/config`

```json
{
    "position": "top",    // Change to: "top", "bottom", "left", "right"
    "height": 40,         // Adjust bar height
}
```

**Location**: `~/.config/waybar/style.css`

```css
window#waybar {
    margin: 10px 20px;  /* Floating effect: top/bottom left/right */
}
```

**Presets**:
```css
/* No floating (full width) */
margin: 0;

/* Small floating */
margin: 5px 10px;

/* Large floating (default) */
margin: 10px 20px;

/* Bottom bar */
margin: 0 20px 10px 20px;  /* top right bottom left */
```

---

## Blur Settings Deep Dive

### Understanding Blur Parameters

```conf
blur {
    enabled = true              # Turn blur on/off
    size = 12                   # Blur radius (pixels)
    passes = 4                  # Number of blur iterations
    new_optimizations = true    # Use optimized blur algorithm
    ignore_opacity = true       # Blur even opaque windows
    xray = false                # Don't blur behind transparent areas
    noise = 0.0117             # Add subtle texture
    contrast = 0.8916          # Adjust contrast
    brightness = 0.8172        # Adjust brightness
    vibrancy = 0.1696          # Color vibrancy (minimal for monochrome)
}
```

### Performance vs Quality

**High Performance** (for slower systems):
```conf
blur {
    enabled = true
    size = 8
    passes = 2
    new_optimizations = true
}
```

**Balanced** (recommended):
```conf
blur {
    enabled = true
    size = 12
    passes = 3
    new_optimizations = true
}
```

**Maximum Quality**:
```conf
blur {
    enabled = true
    size = 16
    passes = 6
    new_optimizations = true
    noise = 0.02
}
```

### Layer Rules for Blur

These rules make specific UI layers blurry:

```conf
layerrule = blur, waybar              # Make Waybar blurry
layerrule = ignorealpha 0.5, waybar   # Blur threshold
layerrule = blur, wofi                # Make Wofi blurry
layerrule = blur, notifications       # Make notifications blurry
```

**What `ignorealpha` does**: It sets a threshold for transparency. Areas with alpha values below this threshold won't be blurred, preventing weird edges.

---

## Window Rules Reference

### Opacity Rules

```conf
# Syntax: windowrulev2 = opacity [ACTIVE] [INACTIVE], [CONDITION]

windowrulev2 = opacity 0.8 0.8, class:^(kitty)$
windowrulev2 = opacity 0.85 0.85, class:^(Code)$
windowrulev2 = opacity 1.0 1.0, class:^(firefox)$  # Fully opaque
```

### Floating Windows

```conf
# Make specific windows float
windowrulev2 = float, class:^(pavucontrol)$
windowrulev2 = float, title:^(Picture-in-Picture)$
```

### Workspace Assignment

```conf
# Auto-assign apps to specific workspaces
windowrulev2 = workspace 1, class:^(kitty)$
windowrulev2 = workspace 2, class:^(firefox)$
windowrulev2 = workspace 3, class:^(Code)$
windowrulev2 = workspace 4, class:^(discord)$
windowrulev2 = workspace 5, class:^(Spotify)$
```

### Size and Position

```conf
# Picture-in-picture example
windowrulev2 = float, title:^(Picture-in-Picture)$
windowrulev2 = pin, title:^(Picture-in-Picture)$
windowrulev2 = size 25% 25%, title:^(Picture-in-Picture)$
windowrulev2 = move 74% 74%, title:^(Picture-in-Picture)$
```

### Finding Window Classes

To find a window's class name:
```bash
hyprctl clients | grep class
```

Or hover over a window and run:
```bash
hyprctl activewindow | grep class
```

---

## Keybindings Reference

### Application Launchers
| Keybind | Action |
|---------|--------|
| `Super + Return` | Open terminal (Kitty) |
| `Super + D` | Open app launcher (Wofi) |
| `Super + R` | Open run prompt |
| `Super + B` | Open browser (Firefox) |
| `Super + E` | Open file manager |

### Window Management
| Keybind | Action |
|---------|--------|
| `Super + Q` | Close window |
| `Super + V` | Toggle floating |
| `Super + F` | Toggle fullscreen |
| `Super + J` | Toggle split |
| `Super + M` | Exit Hyprland |

### Focus Movement
| Keybind | Action |
|---------|--------|
| `Super + ←/→/↑/↓` | Move focus |
| `Super + Shift + ←/→/↑/↓` | Move window |

### Workspaces
| Keybind | Action |
|---------|--------|
| `Super + 1-9` | Switch to workspace 1-9 |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + S` | Toggle scratchpad |
| `Super + Mouse Wheel` | Scroll workspaces |

### Resize Mode
| Keybind | Action |
|---------|--------|
| `Super + A` | Enter resize mode |
| `→/←/↑/↓` | Resize window (in resize mode) |
| `Escape` | Exit resize mode |

### Media Controls
| Keybind | Action |
|---------|--------|
| `XF86AudioRaiseVolume` | Volume up |
| `XF86AudioLowerVolume` | Volume down |
| `XF86AudioMute` | Mute toggle |
| `XF86AudioPlay` | Play/pause |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86MonBrightnessUp` | Brightness up |
| `XF86MonBrightnessDown` | Brightness down |

### Screenshots
| Keybind | Action |
|---------|--------|
| `Print` | Screenshot selection |
| `Shift + Print` | Screenshot full screen |

### System
| Keybind | Action |
|---------|--------|
| `Super + Shift + C` | Reload Hyprland config |

---

## Troubleshooting

### Waybar Not Blurry

**Problem**: Waybar appears solid or pixelated, not blurred.

**Solutions**:
1. Check layer rules in `hyprland.conf`:
```conf
layerrule = blur, waybar
layerrule = ignorealpha 0.5, waybar
```

2. Ensure Waybar has transparency in `style.css`:
```css
window#waybar {
    background-color: rgba(0, 0, 0, 0.7);  /* Must use rgba with alpha */
}
```

3. Restart Waybar:
```bash
killall waybar
waybar &
```

### Fonts Look Wrong

**Problem**: Text appears with wrong font or missing icons.

**Solutions**:
1. Install JetBrainsMono Nerd Font:
```bash
sudo pacman -S ttf-jetbrains-mono-nerd
```

2. Rebuild font cache:
```bash
fc-cache -fv
```

3. Verify font installation:
```bash
fc-list | grep -i jetbrains
```

### Blur Too Slow / Laggy

**Problem**: Desktop feels sluggish with blur enabled.

**Solutions**:
1. Reduce blur quality in `hyprland.conf`:
```conf
blur {
    size = 8
    passes = 2
}
```

2. Disable blur for specific windows:
```conf
windowrulev2 = noblur, class:^(firefox)$
```

3. Check GPU drivers are properly installed

### Waybar Not Starting

**Problem**: No bar appears at top of screen.

**Solutions**:
1. Check if Waybar is running:
```bash
ps aux | grep waybar
```

2. Start Waybar manually:
```bash
waybar &
```

3. Check for errors:
```bash
waybar 2>&1 | tee ~/waybar-error.log
```

4. Ensure autostart is in `hyprland.conf`:
```conf
exec-once = waybar
```

### Wofi Doesn't Match Theme

**Problem**: Launcher looks different from screenshots.

**Solutions**:
1. Ensure both config files exist:
   - `~/.config/wofi/config`
   - `~/.config/wofi/style.css`

2. Launch Wofi with explicit style:
```bash
wofi --show drun --style ~/.config/wofi/style.css
```

3. Check for conflicting Wofi configs

### Windows Not Transparent

**Problem**: Terminal or other windows are fully opaque.

**Solutions**:
1. Check window rules in `hyprland.conf`:
```conf
windowrulev2 = opacity 0.8 0.8, class:^(kitty)$
```

2. Verify window class:
```bash
hyprctl clients | grep class
```

3. Add rule for your specific app:
```conf
windowrulev2 = opacity 0.8 0.8, class:^(YOUR_APP)$
```

### Spotify Theme Not Working

**Problem**: Spotify still has default colors.

**Solutions**:
1. Ensure Spicetify is installed:
```bash
spicetify --version
```

2. Copy color.ini to correct location:
```bash
mkdir -p ~/.config/spicetify/Themes/Sleek
cp color.ini ~/.config/spicetify/Themes/Sleek/
```

3. Apply theme:
```bash
spicetify config current_theme Sleek
spicetify config color_scheme saneAspect-noir
spicetify apply
```

### Keybindings Not Working

**Problem**: Keyboard shortcuts don't respond.

**Solutions**:
1. Reload Hyprland config:
```bash
hyprctl reload
```

2. Check for conflicting keybinds in `hyprland.conf`

3. Test keybind manually:
```bash
hyprctl dispatch exec kitty
```

### Wallpaper Not Showing

**Problem**: No background wallpaper or errors with hyprpaper.

**Solutions**:
1. Check wallpaper path in `hyprpaper.conf`:
```conf
preload = ~/.config/hypr/wallpapers/noir-wallpaper.png
wallpaper = ,~/.config/hypr/wallpapers/noir-wallpaper.png
```

2. Ensure image exists:
```bash
ls ~/.config/hypr/wallpapers/
```

3. Restart hyprpaper:
```bash
killall hyprpaper
hyprpaper &
```

### Getting More Help

1. **Hyprland Wiki**: https://wiki.hyprland.org/
2. **Check logs**:
```bash
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log
```
3. **Join Hyprland Discord**: https://discord.gg/hQ9XvMUjjr

---

## Advanced Tips

### Creating Custom Workspace Names

Edit `waybar/config`:
```json
"hyprland/workspaces": {
    "format-icons": {
        "1": "",  # Terminal icon
        "2": "",  # Browser icon
        "3": "",  # Code icon
        "4": "󰙯",  # Chat icon
        "5": "",  # Music icon
    }
}
```

### Auto-Start Applications

Add to `hyprland.conf`:
```conf
exec-once = firefox
exec-once = discord
exec-once = spotify
```

### Different Opacity for Different Apps

```conf
windowrulev2 = opacity 0.95 0.95, class:^(Code)$       # VS Code
windowrulev2 = opacity 0.90 0.90, class:^(discord)$    # Discord
windowrulev2 = opacity 0.85 0.85, class:^(Spotify)$    # Spotify
windowrulev2 = opacity 0.80 0.80, class:^(kitty)$      # Terminal
windowrulev2 = opacity 1.00 1.00, class:^(firefox)$    # Browser (opaque)
```

### Per-Workspace Blur

```conf
# Example: No blur on workspace 5 (for gaming)
windowrulev2 = noblur, workspace:5
```

---

**Enjoy your saneAspect Noir desktop!**
