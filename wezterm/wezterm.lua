-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.font = wezterm.font 'JetBrains Mono'
config.default_prog = { 'fish', '-l' }
config.color_scheme = 'Catppuccin Mocha'

config.window_background_opacity = 0.85

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
	-- This will create a new split and run the `top` program inside it
	{
		key = '%',
		mods = 'CTRL|SHIFT|ALT',
		action = wezterm.action.SplitPane {
			direction = 'Left',
			-- command = { args = { 'top' } },
			size = { Percent = 50 },
		},
	},
}

return config
