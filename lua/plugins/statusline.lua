-- ~/.config/nvim/lua/plugins/statusline.lua
-- lualine theme for "guts". This imports guts.theme directly instead of
-- re-typing hex values — the old koda setup kept two hardcoded copies
-- of the same palette and relied on a comment to remind you to update
-- both. That's exactly the kind of drift that produces a statusline
-- that visibly seams against the rest of the UI. One source of truth
-- now: edit lua/guts/palette.lua or lua/guts/theme.lua and this file
-- picks it up automatically.
local c = require("guts.theme")

-- Mode accent colors aren't part of the upstream guts palette/theme
-- README (it only defines syntax + UI roles), so this is a judgment
-- call layered on top: green/orange/blue/red/pink read as the natural
-- "temperature" mapping for normal/insert/visual/replace/command
-- against this palette's existing hues.
local mode_colors = {
  normal = c.highlight, -- brand_of_sacrifice_green_1
  insert = c.entity, -- campfire_orange
  visual = c.type, -- night_sky_blue
  replace = c.error, -- blood_red
  command = c.special, -- casca_pink
}

local function mode_theme(accent)
  return {
    a = { bg = accent, fg = c.bg, gui = "bold" },
    b = { bg = c.bg_alt, fg = c.fg },
    c = { bg = c.bg, fg = c.fg_subtle },
  }
end

local guts_lualine = {
  normal = mode_theme(mode_colors.normal),
  insert = mode_theme(mode_colors.insert),
  visual = mode_theme(mode_colors.visual),
  replace = mode_theme(mode_colors.replace),
  command = mode_theme(mode_colors.command),
  inactive = {
    a = { bg = c.bg, fg = c.fg_muted },
    b = { bg = c.bg, fg = c.fg_muted },
    c = { bg = c.bg, fg = c.fg_muted },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = guts_lualine,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          { "diagnostics", symbols = { error = " ", warn = " ", hint = "󰠠 ", info = " " } },
        },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
