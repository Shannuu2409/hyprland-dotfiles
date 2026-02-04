# Changelog - saneAspect Noir

All notable changes to this Hyprland configuration will be documented in this file.

## [1.0.0] - 2026-02-01

### Initial Release

Complete saneAspect Noir theme package with monochromatic aesthetic and glassmorphism.

#### Added

**Configuration Files**:
- Hyprland configuration with heavy blur (size 12, passes 4)
- Waybar floating glassmorphic status bar
- Kitty terminal with monochrome color scheme
- Wofi application launcher matching theme
- Dunst notification daemon with blur support
- Spicetify Spotify theme (optional)
- Hyprpaper wallpaper manager configuration

**Documentation**:
- README.md - Main installation guide
- CONFIGURATION-GUIDE.md - Comprehensive customization reference
- WALLPAPER-GUIDE.md - Wallpaper recommendations and creation
- QUICK-REFERENCE.md - One-page cheat sheet
- FILE-STRUCTURE.md - Complete package structure
- CHANGELOG.md - This file

**Scripts**:
- install.sh - Automated installation with backups

**Features**:
- Strict monochromatic color palette (black, white, greys only)
- Heavy Gaussian blur on all transparent elements
- Glassmorphism with 0.7-0.8 opacity
- Solid white borders on active elements
- Complete keybinding system
- Window rules for common applications
- Workspace assignments
- Layer rules for Waybar, Wofi, and Dunst blur
- Optimized blur settings for performance
- Comprehensive window management
- Media controls and brightness keybindings

**Aesthetic Principles**:
- Pure black (#000000) backgrounds
- Pure white (#ffffff) text and active borders
- Dark grey (#333333, #444444) inactive elements
- No colors whatsoever - strict monochrome only
- 10px corner rounding throughout
- 2px white borders for glassmorphism effect
- JetBrainsMono Nerd Font for consistent typography

#### Configuration Highlights

**Hyprland**:
- Border: 2px white active, grey inactive
- Rounding: 10px
- Blur: 12 size, 4 passes, optimized
- Gaps: 5px inner, 10px outer
- Smart animations with custom bezier curves
- 50+ window rules
- Complete keybinding system (50+ bindings)

**Waybar**:
- Floating card design (10px margin)
- Background: rgba(0, 0, 0, 0.7)
- 2px solid white border
- Custom workspace icons (一二三四五...)
- CPU, memory, network, battery, audio modules
- Monochrome tooltips

**Kitty**:
- 16-color monochrome palette
- 0.8 background opacity
- JetBrainsMono font
- Custom tab bar styling
- Black and white cursor

**Wofi**:
- 600x400 centered launcher
- Fuzzy matching
- Glassmorphic appearance matching Waybar
- Custom scrollbar styling

**Dunst**:
- Top-right notifications
- 10px corner radius
- Three urgency levels with monochrome colors
- Blur support via layer rules

#### Known Limitations

- Requires Hyprland (not compatible with other window managers)
- Heavy blur may impact performance on older GPUs
- Spicetify theme requires manual Spotify client installation
- Some applications may override opacity settings
- Blur quality depends on GPU capabilities

#### Tested On

- Arch Linux with latest Hyprland
- NVIDIA and AMD graphics
- Various screen resolutions (1080p, 1440p, 4K)

---

## Future Considerations

Potential additions for future versions:

- [ ] Additional terminal themes (Alacritty, Wezterm)
- [ ] GTK3/GTK4 theme matching
- [ ] Qt theme matching
- [ ] Rofi alternative to Wofi
- [ ] Multiple blur presets (performance, balanced, quality)
- [ ] Dynamic wallpaper scripts
- [ ] Workspace-specific blur settings
- [ ] Alternative color schemes (still monochrome)
- [ ] Hyprlock screen locker configuration
- [ ] Hypridle idle daemon configuration

---

## Contributing

If you create improvements or fixes:

1. Fork the configuration
2. Make your changes
3. Test thoroughly
4. Document your changes
5. Share with the community

## Credits

- **Created by**: Assistant
- **Inspired by**: saneAspect Noir aesthetic from YouTube showcase
- **Built for**: Hyprland window manager
- **Font**: JetBrainsMono Nerd Font
- **Theme basis**: Minimalism and monochromatic design principles

## License

This configuration is provided as-is for personal use and modification.
Feel free to share, modify, and distribute with attribution.

---

**Version**: 1.0.0
**Release Date**: February 1, 2026
**Codename**: "Noir Genesis"
