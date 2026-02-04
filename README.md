# Hyprland Dotfiles

**A complete monochromatic dark aesthetic for Hyprland: blur, glassmorphism, and minimalism.**

- Black, white, and grey palette · Heavy blur · Waybar, Kitty, Wofi, Dunst
- Full keybindings (Vim-style focus, workspaces, resize, media)
- [Pre-Installation](#pre-installation) → [Install](#installation) → [Keybindings](#keybindings)

---

## Installation

**From GitHub (easiest):**

```bash
git clone https://github.com/Shannuu2409/hyprland-dotfiles
cd hyprland-dotfiles
chmod +x install.sh
./install.sh
```

The script will back up existing configs, install packages (Hyprland, Waybar, Kitty, Wofi, Dunst, swww, etc.), copy all configs to `~/.config/`, and optionally set a dark GTK theme and Spicetify. Then log out and choose **Hyprland** from your display manager.

**Optional:** Install [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) and a dark GTK theme (e.g. `adw-gtk3`) before or after; see [Pre-Installation](#pre-installation).

---

## Keybindings

**Super** = `$mainMod` (Windows key).

### Applications
| Key | Action |
|-----|--------|
| **Super + Enter** | Terminal (Kitty) |
| **Super + B** | Browser |
| **Super + Space** | App launcher (Wofi) |
| **Super + F** | File manager |
| **Super + O** | Notes / secondary app |
| **Super + S** | Spotify |
| **Super + X** | Toggle Waybar |

### Window management
| Key | Action |
|-----|--------|
| **Super + Q** or **Super + C** | Close window |
| **Super + V** | Toggle floating |
| **Super + P** | Pseudo (single window) |
| **Super + T** | Toggle split |
| **Super + Shift + F** | Fullscreen |
| **Super + M** | Exit Hyprland |

### Focus (Vim-style)
| Key | Action |
|-----|--------|
| **Super + H / Left** | Focus left |
| **Super + L / Right** | Focus right |
| **Super + K / Up** | Focus up |
| **Super + J / Down** | Focus down |

### Move window to workspace
| Key | Action |
|-----|--------|
| **Super + Shift + H/L/K/J** (or arrows) | Swap window in that direction |

### Resize mode
| Key | Action |
|-----|--------|
| **Super + R** | Enter resize mode |
| **H / Left** | Shrink width |
| **L / Right** | Grow width |
| **K / Up** | Shrink height |
| **J / Down** | Grow height |
| **Escape** or **Enter** | Exit resize mode |

### Workspaces
| Key | Action |
|-----|--------|
| **Super + 1 … 0** | Switch to workspace 1–10 |
| **Super + Shift + 1 … 0** | Move window to workspace 1–10 |
| **Super + `** | Toggle scratchpad (special workspace) |
| **Super + Shift + `** | Move window to scratchpad |
| **Super + Scroll** | Cycle workspaces |

### Screenshots & tools
| Key | Action |
|-----|--------|
| **Super + Print** | Screenshot full screen (saved to `~/Pictures/Screenshots/`) |
| **Super + Shift + S** | Screenshot area (copy) |
| **Super + Shift + P** | Screenshot full screen (copy) |
| **Super + Shift + C** | Color picker (requires `hyprpicker`) |

### Media & hardware
| Key | Action |
|-----|--------|
| **Volume +/-** | Volume up/down |
| **Mute** | Toggle mute |
| **Mic Mute** | Toggle microphone mute |
| **Play/Pause, Next, Prev** | Media controls (`playerctl`) |
| **Brightness +/-** | Screen brightness (`brightnessctl`) |

### Mouse
| Action | Effect |
|--------|--------|
| **Super + Left drag** | Move window |
| **Super + Right drag** | Resize window |

**Customize:** Edit `~/.config/hypr/config/keybinds.conf` and `variables.conf` (e.g. `$browser`, `$terminal`). Reload with **Super + Shift + C** if you add a reload key, or restart Hyprland.

---

## Pre-Installation

Do these steps **before** running the installer or copying configs.

### 1. Base System (Arch Linux)

- **Hyprland** requires a Wayland compositor–capable system. Ensure your graphics drivers are installed:
  - **Intel:** `mesa` (usually pre-installed)
  - **AMD:** `mesa vulkan-radeon`
  - **NVIDIA:** `nvidia nvidia-utils` (and see [Hyprland wiki](https://wiki.hyprland.org/Getting-Started/Master-Tutorial/) for env vars)
- Install a **display manager** (optional): `sddm`, `gdm`, or `ly` for TTY.
- Ensure **seat management**: `elogind` or `systemd` (Arch has both).

### 2. Fonts (Required)

GTK, Waybar, Kitty, and Wofi rely on a Nerd Font for icons and consistency.

```bash
# JetBrains Mono Nerd Font (recommended)
sudo pacman -S ttf-jetbrains-mono-nerd

# Rebuild font cache
fc-cache -fv
```

### 3. GTK Settings (Dark Theme & Appearance)

For a consistent dark look in GTK apps (file managers, dialogs, etc.):

**Option A – Using `gsettings` (GNOME/GTK):**

```bash
# Prefer dark theme for GTK 3/4 apps
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adw-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-size 24
```

**Option B – Using `lxappearance` (if you use it):**

- Run `lxappearance`, set **Widget** and **Icon** theme to a dark theme, and **Cursor** theme/size as desired.

**Qt (KDE/Qt apps):** This config sets `QT_QPA_PLATFORMTHEME=qt6ct` in Hyprland’s env. Install and configure Qt6 styling:

```bash
sudo pacman -S qt6ct
```

- Run `qt6ct` once (e.g. from Wofi), set **Style** and **Icon theme** to a dark theme (e.g. Kvantum or Breeze Dark).

### 4. Dark GTK Theme Installation

Install at least one dark GTK theme so `gsettings` or `lxappearance` can use it.

**Option 1 – adw-gtk3 (modern, matches GNOME Adwaita):**

```bash
# Arch
yay -S adw-gtk3
# or
paru -S adw-gtk3
```

Then set it (if using gsettings):

```bash
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
```

**Option 2 – Orchis (dark variant):**

```bash
yay -S orchis-theme-git
# Then in lxappearance or gsettings: Orchis-dark
```

**Option 3 – Catppuccin (dark):**

```bash
yay -S catppuccin-gtk-theme-mocha
# Then set: Catppuccin-Mocha-Standard-Mauve-Dark (or other variant)
```

**Option 4 – Graphite (dark):**

```bash
yay -S graphite-gtk-theme
# Then set: Graphite-dark
```

After installing a theme, apply it via:

- **gsettings:**  
  `gsettings set org.gnome.desktop.interface gtk-theme 'Your-Theme-Name-Dark'`
- **lxappearance:** Run `lxappearance` and choose the theme.

### 5. Optional Pre-Installs

- **Network applet:** `nm-applet` (started from autostart).
- **Bluetooth:** `blueman` + `blueman-applet`.
- **Polkit:** `polkit-kde-agent` or `gnome-keyring` if you use password dialogs.

---

## File Paths (What Gets Installed)

All paths below are relative to this repo’s **linux-configs** directory. The installer copies them into **`~/.config/`** as shown.

### Hyprland (main config + split configs)

| Repo path (source) | Installed path (destination) |
|--------------------|-----------------------------|
| `hypr/hyprland.conf` | `~/.config/hypr/hyprland.conf` |
| `hypr/config/monitors.conf` | `~/.config/hypr/config/monitors.conf` |
| `hypr/config/variables.conf` | `~/.config/hypr/config/variables.conf` |
| `hypr/config/autostart.conf` | `~/.config/hypr/config/autostart.conf` |
| `hypr/config/env.conf` | `~/.config/hypr/config/env.conf` |
| `hypr/config/input.conf` | `~/.config/hypr/config/input.conf` |
| `hypr/config/general.conf` | `~/.config/hypr/config/general.conf` |
| `hypr/config/decoration.conf` | `~/.config/hypr/config/decoration.conf` |
| `hypr/config/animations.conf` | `~/.config/hypr/config/animations.conf` |
| `hypr/config/layouts.conf` | `~/.config/hypr/config/layouts.conf` |
| `hypr/config/gestures.conf` | `~/.config/hypr/config/gestures.conf` |
| `hypr/config/misc.conf` | `~/.config/hypr/config/misc.conf` |
| `hypr/config/windowrules.conf` | `~/.config/hypr/config/windowrules.conf` |
| `hypr/config/keybinds.conf` | `~/.config/hypr/config/keybinds.conf` |
| `hypr/swww-launch.sh` | `~/.config/hypr/swww-launch.sh` |
| `hypr/swww.conf` | `~/.config/hypr/swww.conf` |
| `hypr/wallpapers/wallpaper.jpg` | `~/.config/hypr/wallpapers/wallpaper.jpg` (optional copy) |

**Note:** `hyprland.conf` only sources the files under `~/.config/hypr/config/`; it does **not** use hyprpaper (this setup uses **swww** for wallpapers).

### Waybar

| Repo path (source) | Installed path (destination) |
|--------------------|-----------------------------|
| `waybar/config` | `~/.config/waybar/config` |
| `waybar/config.jsonc` | `~/.config/waybar/config.jsonc` |
| `waybar/style.css` | `~/.config/waybar/style.css` |
| `waybar/modules.json` | `~/.config/waybar/modules.json` |
| `waybar/quicklinks.json` | `~/.config/waybar/quicklinks.json` |
| `waybar/hardware.json` | `~/.config/waybar/hardware.json` |
| `waybar/media.json` | `~/.config/waybar/media.json` |
| `waybar/sound.json` | `~/.config/waybar/sound.json` |
| `waybar/audio-switch.json` | `~/.config/waybar/audio-switch.json` |
| `waybar/scripts/audio-output-icon.sh` | `~/.config/waybar/scripts/audio-output-icon.sh` |
| `waybar/scripts/vpn-status.sh` | `~/.config/waybar/scripts/vpn-status.sh` |
| `waybar/scripts/vpn-toggle.sh` | `~/.config/waybar/scripts/vpn-toggle.sh` |

Waybar may use either `config` or `config.jsonc` depending on your setup; both are installed.

### Kitty

| Repo path (source) | Installed path (destination) |
|--------------------|-----------------------------|
| `kitty/kitty.conf` | `~/.config/kitty/kitty.conf` |

### Wofi

| Repo path (source) | Installed path (destination) |
|--------------------|-----------------------------|
| `wofi/config` | `~/.config/wofi/config` |
| `wofi/style.css` | `~/.config/wofi/style.css` |
| `wofi/colors.css` | `~/.config/wofi/colors.css` |

### Dunst

| Repo path (source) | Installed path (destination) |
|--------------------|-----------------------------|
| `dunst/dunstrc` | `~/.config/dunst/dunstrc` |

### Spicetify (optional)

| Repo path (source) | Installed path (destination) |
|--------------------|-----------------------------|
| `spicetify/Themes/Sleek/color.ini` | `~/.config/spicetify/Themes/Sleek/color.ini` |

---

## After Installation

1. **Wallpaper:** Place your image in `~/.config/hypr/wallpapers/` and set the name in `~/.config/hypr/swww-launch.sh` (or keep `wallpaper.jpg`).
2. **Reload Hyprland:** Log out and choose Hyprland from the display manager (or restart the session).
3. **Waybar:** Uses `config` or `config.jsonc`; both are installed. Start with `waybar -c ~/.config/waybar/config.jsonc` if you use the modular setup.

---

## Pushing to GitHub

This repo is meant to contain **only the dotfiles and installer** (no Node/app code). So the **repo root** should look like:

```
hyprland-dotfiles/
├── README.md
├── install.sh
├── hypr/
├── waybar/
├── kitty/
├── wofi/
├── dunst/
├── spicetify/
└── (optional: CONFIGURATION-GUIDE.md, WALLPAPER-GUIDE.md, etc.)
```

**To push from this project:**

1. Clone your empty repo and go into it:
   ```bash
   git clone https://github.com/Shannuu2409/hyprland-dotfiles
   cd hyprland-dotfiles
   ```
2. Copy **only** the contents of `linux-configs` into the clone (so `install.sh`, `README.md`, `hypr/`, `waybar/`, etc. are at the **root** of `hyprland-dotfiles`):
   ```bash
   cp -r /path/to/your/project/linux-configs/* .
   cp /path/to/your/project/linux-configs/.gitignore .  2>/dev/null || true
   ```
3. Add, commit, and push:
   ```bash
   git add .
   git commit -m "Hyprland dotfiles and installer"
   git push -u origin main
   ```

Then anyone can install with:
`git clone https://github.com/Shannuu2409/hyprland-dotfiles && cd hyprland-dotfiles && chmod +x install.sh && ./install.sh`
