# Wallpaper Recommendations for saneAspect Noir

## Philosophy

The saneAspect Noir aesthetic is built on **strict monochromatic minimalism**. Your wallpaper should enhance this aesthetic, not fight against it.

## Recommended Wallpaper Types

### 1. Pure Black Solid Color
**The Ultimate Minimalist Choice**

Create a pure black wallpaper:
```bash
convert -size 1920x1080 xc:black ~/.config/hypr/wallpapers/noir-wallpaper.png
```

**Advantages**:
- Maximum focus on windows and content
- Best performance (no image processing)
- Pure aesthetic consistency
- Battery efficient (especially on OLED screens)

### 2. Subtle Gradient
**Barely-There Depth**

```bash
# Dark grey to pure black gradient
convert -size 1920x1080 gradient:#111111-#000000 ~/.config/hypr/wallpapers/noir-wallpaper.png
```

**Advantages**:
- Subtle depth without distraction
- Maintains monochrome aesthetic
- Slightly more visual interest than pure black

### 3. Monochrome Photography

**Subject Recommendations**:
- Architecture (brutalist, modern, geometric)
- Abstract patterns
- Nature (forests, mountains, minimalist landscapes)
- Urban scenes (empty streets, cityscapes at night)
- Textures (concrete, fabric, metal)

**Important**: Convert to black and white if not already:
```bash
convert input.jpg -colorspace Gray ~/.config/hypr/wallpapers/noir-wallpaper.png
```

### 4. Geometric Patterns

**Minimal geometric wallpapers work well**:
- Simple line art
- Grid patterns
- Minimalist shapes
- Abstract geometric compositions

**Keep it subtle**: Patterns should be low-contrast (dark grey on black)

## Wallpaper Sources

### Free Stock Photos (Monochrome)
- **Unsplash**: https://unsplash.com/s/photos/black-and-white
- **Pexels**: https://www.pexels.com/search/black%20and%20white/
- **Pixabay**: https://pixabay.com/images/search/monochrome/

### Recommended Search Terms
- "monochrome minimal"
- "black and white architecture"
- "dark minimalist"
- "abstract black"
- "noir aesthetic"

### Wallpaper Communities
- **r/wallpapers** (Reddit): Filter for "minimal" or "dark"
- **r/MinimalWallpaper** (Reddit)
- **Wallhaven**: https://wallhaven.cc/ (tag: monochrome)

## Creating Custom Wallpapers

### Using ImageMagick

**Install**:
```bash
sudo pacman -S imagemagick
```

**Pure Black**:
```bash
convert -size 1920x1080 xc:black noir-wallpaper.png
```

**Dark Grey**:
```bash
convert -size 1920x1080 xc:#0a0a0a noir-wallpaper.png
```

**Gradient**:
```bash
convert -size 1920x1080 gradient:#000000-#1a1a1a noir-wallpaper.png
```

**Noise Texture**:
```bash
convert -size 1920x1080 xc:black +noise Gaussian -colorspace Gray noir-wallpaper.png
```

**Convert Color Image to Monochrome**:
```bash
convert input.jpg -colorspace Gray -brightness-contrast -10x20 noir-wallpaper.png
```

### Multi-Monitor Wallpapers

For different wallpapers per monitor, edit `hyprpaper.conf`:
```conf
preload = ~/.config/hypr/wallpapers/monitor1.png
preload = ~/.config/hypr/wallpapers/monitor2.png

wallpaper = DP-1,~/.config/hypr/wallpapers/monitor1.png
wallpaper = HDMI-A-1,~/.config/hypr/wallpapers/monitor2.png
```

Find your monitor names:
```bash
hyprctl monitors
```

## Resolution Guidelines

**Common Resolutions**:
- 1920x1080 (Full HD)
- 2560x1440 (2K/QHD)
- 3840x2160 (4K/UHD)
- 3440x1440 (Ultrawide)

**Create custom resolution**:
```bash
convert -size WIDTHxHEIGHT xc:black noir-wallpaper.png
```

**For HiDPI/Retina displays**: Use 2x the resolution for crisp images

## Anti-Recommendations

**Avoid These**:
- ❌ Colorful wallpapers (breaks monochrome aesthetic)
- ❌ Busy, complex images (distracts from content)
- ❌ High-contrast wallpapers (fights with UI elements)
- ❌ Bright wallpapers (defeats "noir" theme)
- ❌ Anime/characters (too busy)
- ❌ Logos/brands (distracting)

## Installation

**Place wallpaper**:
```bash
cp your-wallpaper.png ~/.config/hypr/wallpapers/noir-wallpaper.png
```

**Reload hyprpaper**:
```bash
killall hyprpaper
hyprpaper &
```

**Or reload Hyprland completely**:
```bash
hyprctl reload
```

## Dynamic Wallpapers

### Time-Based Wallpapers

Create a script to change wallpaper based on time:

```bash
#!/bin/bash
# ~/.config/hypr/scripts/time-wallpaper.sh

HOUR=$(date +%H)

if [ $HOUR -ge 6 ] && [ $HOUR -lt 12 ]; then
    # Morning: Slightly lighter
    WALLPAPER="morning.png"
elif [ $HOUR -ge 12 ] && [ $HOUR -lt 18 ]; then
    # Afternoon: Medium
    WALLPAPER="afternoon.png"
else
    # Evening/Night: Pure black
    WALLPAPER="night.png"
fi

hyprctl hyprpaper wallpaper ",~/.config/hypr/wallpapers/$WALLPAPER"
```

Add to `hyprland.conf`:
```conf
exec-once = ~/.config/hypr/scripts/time-wallpaper.sh
```

## Example Wallpaper Collection

Here are some commands to create a starter collection:

```bash
cd ~/.config/hypr/wallpapers/

# Pure black
convert -size 1920x1080 xc:black pure-black.png

# Dark charcoal
convert -size 1920x1080 xc:#0a0a0a dark-charcoal.png

# Subtle gradient (top to bottom)
convert -size 1920x1080 gradient:#0a0a0a-#000000 gradient-vertical.png

# Subtle gradient (left to right)
convert -size 1920x1080 gradient:#000000-#0a0a0a -rotate 90 gradient-horizontal.png

# Noise texture
convert -size 1920x1080 xc:black +noise Gaussian -colorspace Gray noise-subtle.png

# Grid pattern
convert -size 1920x1080 pattern:gray5 -colorspace Gray grid-pattern.png
```

Then symlink your favorite:
```bash
ln -sf pure-black.png noir-wallpaper.png
```

## Per-Workspace Wallpapers

While Hyprpaper doesn't natively support per-workspace wallpapers, you can use `swww` instead:

```bash
# Install swww
yay -S swww

# Usage
swww img ~/.config/hypr/wallpapers/workspace1.png
```

Create workspace-switching script:
```bash
#!/bin/bash
WORKSPACE=$1
swww img ~/.config/hypr/wallpapers/workspace${WORKSPACE}.png --transition-type fade
```

## Performance Considerations

**For Best Performance**:
1. Use PNG format (faster loading than JPEG)
2. Match your exact screen resolution (no scaling needed)
3. Prefer solid colors or simple gradients over complex images
4. Compress images if file size is large:
```bash
pngquant --quality 85-95 input.png --output output.png
```

## My Personal Recommendations

**Rank by Aesthetic Purity**:

1. **Pure Black (#000000)** - Ultimate minimalism
2. **Subtle Noise Texture** - Slight visual interest, still minimal
3. **Dark Gradient** - Gentle depth without distraction
4. **Monochrome Architecture** - Geometric beauty
5. **Abstract Black and White** - Artistic but minimal

**Avoid anything that pulls attention away from your work.**

---

**Remember**: The wallpaper is just the canvas. Your workflow, windows, and content are the art.
