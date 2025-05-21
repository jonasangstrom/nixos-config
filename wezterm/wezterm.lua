-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.default_prog = { 'fish', '-l' }
config.color_scheme = 'Catppuccin Mocha'

config.window_background_opacity = 0.85

return config
