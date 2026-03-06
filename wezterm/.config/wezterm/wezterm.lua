local wezterm = require("wezterm")

return {
	-- front_end = "WebGpu",
	-- enable_wayland = true,
	set_environment_variables = {
		TERM = "xterm-256color",
	},
	adjust_window_size_when_changing_font_size = false,
	-- color_scheme = "catppuccin-frappe",
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 11.5,
	window_background_opacity = 0.58,
	macos_window_background_blur = 10,
	window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",
	keys = {
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "'",
			mods = "CTRL",
			action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
		},
	},
	colors = {
		background = "#000000",
		foreground = "#c5c8c6",
	},
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
