# Files Guide for Agents

## File List

- ./app.configs/aerospace/aerospace.toml
- ./app.configs/aerospace/doc.aerospace.md
- ./app.configs/aerospace/features.aerospace.md
- ./app.configs/borders/bordersrc
- ./app.configs/sketchybar/sketchybarrc
- ./app.configs/sketchybar/colors.sh
- ./app.configs/sketchybar/icons.sh
- ./app.configs/sketchybar/items/*.sh (18 files)
- ./app.configs/sketchybar/plugins/*.sh (25 files)
- ./app.configs/vscode/settings.json

## Descriptions

`./app.configs/aerospace/aerospace.toml`
- Main AeroSpace tiling window manager config
- Defines keybindings (alt+hjkl=focus, alt+shift+hjkl=move, alt+1-9=workspace)
- Configures gaps, monitors assignment, startup commands
- Launches sketchybar+borders on startup
- Edit for: keybindings, workspace layout, monitor assignment, gaps

`./app.configs/aerospace/doc.aerospace.md`
- AeroSpace documentation reference
- Read-only reference, don't edit

`./app.configs/aerospace/features.aerospace.md`
- AeroSpace features documentation
- Read-only reference, don't edit

`./app.configs/borders/bordersrc`
- JankyBorders config (window border styling)
- Tokyo Night theme: active=0xffc0caf5, inactive=0xff414868
- Options: style=round, width=4.0, hidpi=on
- Edit for: border colors, width, style

`./app.configs/sketchybar/sketchybarrc`
- Main sketchybar entry point (status bar)
- Sources colors.sh, icons.sh, then items: spaces, calendar, volume, headset, ram, cpu, battery, vpn, wifi, ethernet, network_down, network_up
- Commented out (disabled): apple.sh, settings.sh
- Not sourced (disabled): front_app.sh, brew.sh, github.sh, spotify.sh
- Defines bar: height=58, floating style, transparent bg
- Defines defaults: pill style, corner_radius=10, font=JetBrainsMono
- Groups items into brackets: calendar_group, audio, traffic, resources, connectivity
- Edit for: bar position, default item styling, enable/disable items

`./app.configs/sketchybar/colors.sh`
- Color palette exports (CriticalElement Dotfiles theme)
- Key: PINK=0xffcf6679, DARK_BG=0xEB1e1e2e, TRANSPARENT=0x00000000
- Edit for: global color scheme changes

`./app.configs/sketchybar/icons.sh`
- Nerd Font icon exports
- Categories: general, git, spotify, battery, volume, wifi, network
- Edit for: adding/changing icons

`./app.configs/sketchybar/items/*.sh`
- Item definitions (visual config, positioning, subscriptions)
- Pattern: define item properties, add to bar, subscribe events
- Active items: spaces.sh, calendar.sh, volume.sh, headset.sh, ram.sh, cpu.sh, battery.sh, vpn.sh, wifi.sh, ethernet.sh, network_down.sh, network_up.sh
- Disabled items: apple.sh (commented), settings.sh (commented), front_app.sh (not sourced), brew.sh, github.sh, spotify.sh
- Key file: spaces.sh (workspaces with aerospace integration)
- Edit for: item appearance, positioning, which events trigger updates

`./app.configs/sketchybar/plugins/*.sh`
- Event handlers and data fetchers (25 files)
- Pattern: receive events, query system, update sketchybar items
- Key files: aerospace.sh (workspace state with app name display), battery.sh, cpu.sh, wifi.sh
- aerospace.sh: simplified workspace display, shows app names next to workspace number, uses shorten_app_name() for common apps, multi-monitor support with distinct colors per monitor
- Edit for: logic of what's displayed, data sources, formatting

`./app.configs/vscode/settings.json`
- VSCode editor settings
- Font sizes, formatters, Claude Code config, icon themes
- Minimal UI: statusBar=hidden, activityBar=hidden, minimap=off
- Edit for: editor preferences, extension configs
