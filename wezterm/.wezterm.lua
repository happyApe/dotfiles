local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_schemes = {
	["Monokai Pure Black"] = {
		background = "#000000",
		foreground = "#f8f8f2",
		cursor_bg = "#f8f8f2",
		cursor_fg = "#000000",
		selection_bg = "#f8f8f2",
		selection_fg = "#000000",

		ansi = {
			"#000000", -- color0 (black)
			"#f92672", -- color1 (red)
			"#a6e22e", -- color2 (green)
			"#e6db74", -- color3 (yellow)
			"#66d9ef", -- color4 (blue)
			"#fd971f", -- color5 (magenta)
			"#ae81ff", -- color6 (cyan)
			"#f8f8f2", -- color7 (white)
		},
		brights = {
			"#75715e", -- color8 (bright black)
			"#f92672", -- color9 (bright red)
			"#a6e22e", -- color10 (bright green)
			"#e6db74", -- color11 (bright yellow)
			"#66d9ef", -- color12 (bright blue)
			"#fd971f", -- color13 (bright magenta)
			"#ae81ff", -- color14 (bright cyan)
			"#f8f8f2", -- color15 (bright white)
		},

		-- WezTerm-specific properties for tabs and title bar
		tab_bar = {
			active_tab = {
				bg_color = "#75715e",
				fg_color = "#000000",
				-- This maps to active_border_color
			},
			inactive_tab = {
				bg_color = "#000000",
				fg_color = "#75715e",
				-- This maps to inactive_border_color
			},
		},
	},
}
config.color_scheme = "Monokai Pure Black"
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.hide_tab_bar_if_only_one_tab = true

config.font_size = 15
config.font = wezterm.font("SauceCodePro Nerd Font")

-- and finally, return the configuration to wezterm
return config
