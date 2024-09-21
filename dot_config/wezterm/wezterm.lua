local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

package.path = "/opt/homebrew/share/lua/5.4/?.lua;" .. package.path

local function merge(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
end

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		mods = "LEADER",
		key = "-",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "x",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "c",
		action = act.CreateTab(),
	},
	{
		mods = "LEADER",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "h",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
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
		action = act.ShowTabNavigator,
	},
	{
		key = "&",
		mods = "LEADER|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "H",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Left", 5 }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false, timeout_milliseconds = 350 }),
		}),
	},
	{
		key = "J",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Down", 5 }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false, timeout_milliseconds = 350 }),
		}),
	},
	{
		key = "K",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Up", 5 }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false, timeout_milliseconds = 350 }),
		}),
	},
	{
		key = "L",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Right", 5 }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false, timeout_milliseconds = 350 }),
		}),
	},
}

config.switch_to_last_active_tab_when_closing_tab = true

local resize_keymaps = {
	{
		key = "H",
		action = act.Multiple({
			act.AdjustPaneSize({ "Left", 5 }),
		}),
	},
	{
		key = "J",
		action = act.Multiple({
			act.AdjustPaneSize({ "Down", 5 }),
		}),
	},
	{
		key = "K",
		action = act.Multiple({
			act.AdjustPaneSize({ "Up", 5 }),
		}),
	},
	{
		key = "L",
		action = act.Multiple({
			act.AdjustPaneSize({ "Right", 5 }),
		}),
	},
}

config.key_tables = {
	resize_pane = resize_keymaps,
}

wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		print("update with name" .. name)
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

config.skip_close_confirmation_for_processes_named = {}

-- Appearance
merge(config, {
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = true,
	window_decorations = "RESIZE",
	font = wezterm.font("Hack Nerd Font Mono"),
	font_size = 13.0,
})

return config
