# saneAspect Noir - Complete File Structure

## Package Contents

```
linux-configs/
│
├── README.md                          # Main overview and installation guide
├── CONFIGURATION-GUIDE.md             # Detailed customization guide
├── WALLPAPER-GUIDE.md                 # Wallpaper recommendations
├── QUICK-REFERENCE.md                 # One-page cheat sheet
├── FILE-STRUCTURE.md                  # This file
├── install.sh                         # Automated installation script
│
├── hypr/                              # Hyprland configuration
│   ├── hyprland.conf                  # Main Hyprland config
│   └── hyprpaper.conf                 # Wallpaper manager config
│
├── waybar/                            # Status bar configuration
│   ├── config                         # Waybar modules (JSON)
│   └── style.css                      # Waybar appearance (CSS)
│
├── kitty/                             # Terminal configuration
│   └── kitty.conf                     # Complete Kitty config
│
├── wofi/                              # Application launcher
│   ├── config                         # Launcher behavior
│   └── style.css                      # Launcher appearance
│
├── dunst/                             # Notifications
│   └── dunstrc                        # Dunst configuration
│
└── spicetify/                         # Spotify theming (optional)
    └── Themes/
        └── Sleek/
            └── color.ini              # Monochrome color scheme
```

## Installation Destination

After installation, files will be located at:

```
~/.config/
│
├── hypr/
│   ├── hyprland.conf                  # ← From: linux-configs/hypr/hyprland.conf
│   ├── hyprpaper.conf                 # ← From: linux-configs/hypr/hyprpaper.conf
│   └── wallpapers/                    # ← YOU CREATE: Add your wallpapers here
│       └── noir-wallpaper.png         # ← Main wallpaper (you provide)
│
├── waybar/
│   ├── config                         # ← From: linux-configs/waybar/config
│   └── style.css                      # ← From: linux-configs/waybar/style.css
│
├── kitty/
│   └── kitty.conf                     # ← From: linux-configs/kitty/kitty.conf
│
├── wofi/
│   ├── config                         # ← From: linux-configs/wofi/config
│   └── style.css                      # ← From: linux-configs/wofi/style.css
│
├── dunst/
│   └── dunstrc                        # ← From: linux-configs/dunst/dunstrc
│
└── spicetify/                         # (Optional)
    └── Themes/
        └── Sleek/
            └── color.ini              # ← From: linux-configs/spicetify/.../color.ini
```

## File Descriptions

### Documentation Files

#### `README.md`
**Purpose**: Main entry point for the configuration package
**Contains**:
- Quick start guide
- Installation instructions
- Prerequisites
- Package overview
- Color palette reference

**When to read**: First time setup

#### `CONFIGURATION-GUIDE.md`
**Purpose**: Comprehensive customization reference
**Contains**:
- File structure explained
- Detailed customization examples
- Blur settings deep dive
- Window rules reference
- Complete keybindings list
- Troubleshooting solutions

**When to read**: When customizing or troubleshooting

#### `WALLPAPER-GUIDE.md`
**Purpose**: Wallpaper selection and creation
**Contains**:
- Wallpaper philosophy
- Recommended sources
- Creation commands (ImageMagick)
- Resolution guidelines
- Dynamic wallpaper scripts

**When to read**: When setting up or changing wallpapers

#### `QUICK-REFERENCE.md`
**Purpose**: One-page cheat sheet
**Contains**:
- Essential keybindings
- Common customizations
- Troubleshooting quick fixes
- Command snippets

**When to read**: Daily reference (print or keep open)

#### `FILE-STRUCTURE.md`
**Purpose**: Understanding package organization
**Contains**:
- Complete file tree
- Installation mapping
- File descriptions
- Customization priority

**When to read**: Understanding the package structure

### Configuration Files

#### `hypr/hyprland.conf`
**Purpose**: Main Hyprland window manager configuration
**Size**: ~400 lines
**Key sections**:
- General settings (gaps, borders, layout)
- Decoration (blur, rounding, shadows, opacity)
- Animations (window movements, transitions)
- Window rules (opacity, floating, workspace assignments)
- Keybindings (all keyboard shortcuts)
- Layer rules (blur for Waybar, Wofi, notifications)

**Customization priority**: HIGH
**Most commonly edited**:
- Blur settings (`decoration.blur`)
- Keybindings (`bind =`)
- Window rules (`windowrulev2 =`)
- Gaps and rounding (`general`)

#### `hypr/hyprpaper.conf`
**Purpose**: Wallpaper manager configuration
**Size**: ~10 lines
**Key settings**:
- Wallpaper preload paths
- Monitor-specific wallpapers
- IPC settings

**Customization priority**: MEDIUM
**Edit when**: Changing wallpapers or adding monitors

#### `waybar/config`
**Purpose**: Waybar module configuration (JSON)
**Size**: ~80 lines
**Key sections**:
- Module layout (left, center, right)
- Module settings (format, behavior)
- Click actions

**Customization priority**: MEDIUM
**Most commonly edited**:
- Module selection (`modules-left`, `modules-right`)
- Time format (`clock.format`)
- Timezone settings

#### `waybar/style.css`
**Purpose**: Waybar visual appearance
**Size**: ~250 lines
**Key sections**:
- Main window (floating effect, blur)
- Workspace buttons
- Module styling (CPU, memory, battery, etc.)
- Hover effects
- Tooltips

**Customization priority**: HIGH
**Most commonly edited**:
- Background opacity (`background-color: rgba(0, 0, 0, 0.7)`)
- Margins (floating effect)
- Border colors
- Module spacing

#### `kitty/kitty.conf`
**Purpose**: Terminal emulator configuration
**Size**: ~200 lines
**Key sections**:
- Font settings
- Color scheme (16 monochrome colors)
- Background opacity
- Window padding
- Tab bar style
- Keybindings

**Customization priority**: MEDIUM
**Most commonly edited**:
- Font size (`font_size`)
- Background opacity (`background_opacity`)
- Color values (`color0` - `color15`)

#### `wofi/config`
**Purpose**: Application launcher behavior
**Size**: ~25 lines
**Key settings**:
- Window dimensions
- Display mode (drun, run)
- Matching algorithm (fuzzy)
- Image settings

**Customization priority**: LOW
**Rarely needs editing**

#### `wofi/style.css`
**Purpose**: Application launcher appearance
**Size**: ~150 lines
**Key sections**:
- Main window (blur, borders)
- Search input field
- Result entries
- Scrollbar
- Selection highlighting

**Customization priority**: MEDIUM
**Most commonly edited**:
- Background opacity
- Border colors
- Entry hover effects

#### `dunst/dunstrc`
**Purpose**: Notification daemon configuration
**Size**: ~100 lines
**Key sections**:
- Geometry and positioning
- Font and appearance
- Frame and borders
- Urgency levels (low, normal, critical)
- Mouse actions

**Customization priority**: LOW
**Most commonly edited**:
- Position (`origin`, `offset`)
- Opacity and colors
- Timeout values

#### `spicetify/Themes/Sleek/color.ini`
**Purpose**: Spotify color scheme (optional)
**Size**: ~60 lines
**Key sections**:
- Main colors (foreground, background)
- Accent colors
- Text colors
- Background variants

**Customization priority**: LOW
**Note**: Requires Spicetify CLI installed

### Scripts

#### `install.sh`
**Purpose**: Automated installation script
**Size**: ~200 lines
**Functions**:
- Backup existing configs
- Install required packages (Arch Linux)
- Copy configuration files
- Verify font installation
- Setup wallpaper directory
- Install Spicetify theme (optional)
- Display final instructions

**When to use**: Initial setup
**Permissions**: Executable (`chmod +x install.sh`)

## Customization Priority Guide

### Must Customize
1. **Wallpaper** (`~/.config/hypr/wallpapers/noir-wallpaper.png`)
   - Add your own wallpaper or create a solid black one

### Highly Recommended to Customize
1. **Blur settings** (`hyprland.conf` → `decoration.blur`)
   - Adjust for your GPU performance
2. **Keybindings** (`hyprland.conf` → `bind =`)
   - Match your workflow preferences
3. **Waybar opacity** (`waybar/style.css`)
   - Adjust to your preference (0.5 - 0.9)

### Optional Customization
1. **Window rules** (`hyprland.conf` → `windowrulev2`)
   - Add rules for your specific applications
2. **Waybar modules** (`waybar/config`)
   - Add/remove system information widgets
3. **Terminal colors** (`kitty.conf` → `color0-15`)
   - Fine-tune monochrome shades
4. **Gaps and rounding** (`hyprland.conf` → `general`)
   - Adjust spacing to taste

### Rarely Need to Change
1. **Wofi configuration**
2. **Dunst settings**
3. **Hyprpaper config** (unless multi-monitor)

## File Dependencies

```
hyprland.conf
├── Depends on: waybar/config, waybar/style.css (for layerrules)
├── Depends on: hyprpaper.conf (for wallpaper)
├── Depends on: kitty.conf (for terminal keybind)
└── Depends on: wofi/* (for launcher keybind)

waybar/config
└── Depends on: waybar/style.css (for appearance)

hyprpaper.conf
└── Depends on: wallpaper file existing

All CSS files
└── Depend on: JetBrainsMono Nerd Font installed

spicetify/color.ini
└── Depends on: Spicetify CLI + Sleek theme installed
```

## Backup Recommendations

**Before modifying**:
```bash
# Backup specific config
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.backup

# Or backup entire config directory
cp -r ~/.config/hypr ~/.config/hypr.backup
```

**The install script automatically creates backups** in:
```
~/.config/hyprland-backup-YYYYMMDD-HHMMSS/
```

## Version Control

**Recommended**: Keep your configs in a Git repository

```bash
cd ~/.config
git init
git add hypr/ waybar/ kitty/ wofi/ dunst/
git commit -m "Initial saneAspect Noir configuration"
```

**Dotfiles repository structure**:
```
~/.dotfiles/
├── hypr/
├── waybar/
├── kitty/
├── wofi/
└── dunst/

# Symlink to .config
ln -s ~/.dotfiles/hypr ~/.config/hypr
ln -s ~/.dotfiles/waybar ~/.config/waybar
# ... etc
```

## Finding Your Config Files

**Check if a config is being used**:
```bash
# Hyprland
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log | grep "config"

# Waybar
ps aux | grep waybar

# Kitty
kitty --debug-config
```

**Edit config directly**:
```bash
# Using your editor
$EDITOR ~/.config/hypr/hyprland.conf
$EDITOR ~/.config/waybar/style.css
$EDITOR ~/.config/kitty/kitty.conf
```

**Quick access aliases** (add to `~/.bashrc` or `~/.zshrc`):
```bash
alias hypr-config='$EDITOR ~/.config/hypr/hyprland.conf'
alias waybar-config='$EDITOR ~/.config/waybar/config'
alias waybar-style='$EDITOR ~/.config/waybar/style.css'
alias kitty-config='$EDITOR ~/.config/kitty/kitty.conf'
```

## Additional Files You May Create

As you customize, you might create:

```
~/.config/hypr/
├── scripts/                    # Custom scripts
│   ├── screenshot.sh
│   ├── toggle-blur.sh
│   └── workspace-wallpaper.sh
├── wallpapers/                 # Multiple wallpapers
│   ├── noir-wallpaper.png
│   ├── workspace-1.png
│   └── secondary-monitor.png
└── hyprland.d/                 # Split configs (advanced)
    ├── keybinds.conf
    ├── window-rules.conf
    └── autostart.conf
```

## File Format Reference

- `.conf` files: Usually use Hyprland syntax (key = value)
- `.css` files: Standard CSS syntax
- `.ini` files: INI format (key = value in sections)
- JSON files: Standard JSON (used by Waybar config)

---

**This structure is designed to be intuitive and maintainable. All files are heavily commented to guide you through customization.**
