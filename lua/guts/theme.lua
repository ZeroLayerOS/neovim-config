-- ~/.config/nvim/lua/guts/theme.lua
-- Semantic roles, mapped straight from the palette README's "usage" column:
--   rainy_night_black_1  -> Default background
--   rainy_night_black_2  -> Alternate background
--   dragon_slayer_white  -> Default foreground
--   dragon_slayer_gray_1 -> Muted foreground   (comments, borders, line numbers)
--   dragon_slayer_gray_2 -> Subtle foreground  (statusline, identifiers)
--   snow_gray            -> Keywords
--   blood_red             -> Errors
--   eclipse_red           -> Diff delete background
--   campfire_orange       -> Entities (classes, resources, ...), warnings
--   casca_pink            -> Special language features (ex. Python self)
--   eclipse_pink          -> Constants
--   griffith_purple       -> Functions
--   night_sky_blue        -> Types
--   night_sky_green       -> Parameters, members
--   cliff_green           -> Strings, directories
--   moss_green            -> Diff add background
--   brand_of_sacrifice_green_1 -> Highlights (searching, selection)
--   brand_of_sacrifice_green_2 -> Strong highlights (searching, selection)
local palette = require("guts.palette")

local theme = {
	bg = palette.rainy_night_black_1,
	bg_alt = palette.rainy_night_black_2,
	fg = palette.dragon_slayer_white,
	fg_subtle = palette.dragon_slayer_gray_2,
	fg_muted = palette.dragon_slayer_gray_1,
	special = palette.casca_pink,
	constant = palette.eclipse_pink,
	parameter = palette.night_sky_green,
	string = palette.cliff_green,
	highlight = palette.brand_of_sacrifice_green_1,
	highlight_strong = palette.brand_of_sacrifice_green_2,
	diff_add = palette.moss_green,
	diff_delete = palette.eclipse_red,
	type = palette.night_sky_blue,
	keyword = palette.snow_gray,
	entity = palette.campfire,
	function_name = palette.griffith_purple,
	error = palette.blood_red,
}

return theme
