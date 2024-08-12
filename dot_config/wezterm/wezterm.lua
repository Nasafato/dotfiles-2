local wezterm = require("wezterm")
local config = {}
local theme = require("lua/rose-pine").main

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
	{
		key = "&",
		mods = "LEADER|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}
-- config.use_fancy_tab_bar = true
-- config.colors = {
-- 	tab_bar = {
-- 		active_tab = {
-- 			-- I use a solarized dark theme; this gives a teal background to the active tab
-- 			fg_color = "#073642",
-- 			bg_color = "#2aa198",
-- 		},
-- 	},
-- }
config.switch_to_last_active_tab_when_closing_tab = true

config.skip_close_confirmation_for_processes_named = {}

local function merge(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
end

-- Appearance
merge(config, {
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = true,
	window_decorations = "RESIZE",
	font = wezterm.font("Hack Nerd Font Mono"),
	font_size = 13.0,
})

return config


return config
