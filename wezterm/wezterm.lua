local wezterm = require("wezterm")
local config = {}

-- config.color_scheme = "Batman"
config.color_scheme = 'Kanagawa (Gogh)'
-- config.color_scheme = "Catppuccin Mocha"
-- config.font = wezterm.font("JetBrainsMono NF")
config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 14.5
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.initial_rows = 50
config.initial_cols = 200
config.window_padding = {
  left = 4,
  right = 10,
  top = 10,
  bottom = 1,
}
-- config.window_background_opacity = 0.27
-- config.macos_window_background_blur = 30
-- config.macos_window_background_blur = 0


-- WALLPAPER SHIT STARTS HERE

-- config.window_background_image_hsb = {
-- 	brightness = 0.00,
  -- brightness = 0.08,
-- }

-- local wallpaper_folder = "/Users/shivansh/Downloads/nvim/dark"
-- -- local wallpaper_folder = "/Users/shivansh/Downloads/nvim"
-- local function get_image_files()
-- 	local files = {}
-- 	for file in io.popen('ls "' .. wallpaper_folder .. '"'):lines() do
-- 		if file:match("%.png$") or file:match("%.jpg$") or file:match("%.jpeg$") then
-- 			table.insert(files, wallpaper_folder .. "/" .. file)
-- 		end
-- 	end
-- 	return files
-- end
--
-- local function set_random_wallpaper()
-- 	local files = get_image_files()
-- 	if #files == 0 then
-- 		wezterm.log_error("No images found in the wallpaper folder")
-- 		return
-- 	end
-- 	local random_index = math.random(1, #files)
-- 	local selected_wallpaper = files[random_index]
-- 	config.window_background_image = selected_wallpaper
-- end

-- set_random_wallpaper()

-- config.window_background_image = "/Users/shivansh/Downloads/nvim/dark/Untitled12.jpg"
-- config.window_background_image = "/Users/shivansh/Documents/Wallpapers/wallpapers/japan-neo-(4K).jpg"
-- config.window_background_image = "/Users/shivansh/Documents/Wallpapers/Anime:Waifu Wallpapers/himmel&frieren.jpeg"
-- config.window_background_image = "/Users/shivansh/Documents/Wallpapers/Anime:Waifu Wallpapers/darkEyes.jpg"
-- config.window_background_image = "/Users/shivansh/Documents/Wallpapers/Anime:Waifu Wallpapers/coolGuy.jpg"
-- config.window_background_image = "/Users/shivansh/Documents/Wallpapers/Anime:Waifu Wallpapers/road.jpg"
-- config.window_background_image = "/Users/shivansh/Downloads/graffiti.png"


-- WALLPAPER SHIT ENDS HERE

config.keys = {
	{
		key = '"',
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

return config
