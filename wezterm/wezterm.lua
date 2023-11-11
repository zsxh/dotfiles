-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices


-- maximize window on startup
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- changing the color scheme:
local custom_doom_one = wezterm.color.get_builtin_schemes()['DoomOne'];
custom_doom_one.ansi[5] = '#268bd2' -- ansi blue
custom_doom_one.brights[5] = '#51afef' -- bright blue
config.color_schemes = {
  ['CustomDoomOne'] = custom_doom_one,
}
config.color_scheme = 'CustomDoomOne'

-- font
config.font = wezterm.font("MesloLGS NF", { weight = 'Medium'})
config.font_size = 16.0


-- and finally, return the configuration to wezterm
return config
