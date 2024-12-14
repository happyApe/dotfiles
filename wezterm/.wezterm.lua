local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Default Dark (base16)'
config.window_decorations = 'RESIZE'
config.use_fancy_tab_bar = true
config.scrollback_lines = 10000
config.enable_scroll_bar = true
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.hide_tab_bar_if_only_one_tab = true

config.font_size = 16
config.font = wezterm.font 'Hack Nerd Font'

-- and finally, return the configuration to wezterm
return config
