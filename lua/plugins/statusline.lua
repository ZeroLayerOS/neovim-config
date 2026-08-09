-- Same N0tch2k hex values as colorscheme.lua, so lualine matches the
-- terminal/editor palette 1:1 instead of drifting from the leftover
-- "kanagawa-dragon" theme that no longer matches your colorscheme.
local c = {
  bg0 = "#222222", -- background
  bg1 = "#383838", -- color0 (statusline bg)
  fg = "#a0a0a0", -- foreground
  green = "#98bd5e", -- color12 (most saturated color N0tch2k has -- normal mode)
  aqua = "#c9c9c9", -- color6 (neutral light grey "cyan" -- insert mode)
  yellow = "#a99175", -- color11 (visual mode)
  red = "#a95551", -- color1 (replace mode)
  grey1 = "#a3a3a3", -- color13
}

local n0tch2k = {
  normal = {
    a = { bg = c.green, fg = c.bg0, gui = "bold" },
    b = { bg = c.bg1, fg = c.fg },
    c = { bg = c.bg0, fg = c.grey1 },
  },
  insert = {
    a = { bg = c.aqua, fg = c.bg0, gui = "bold" },
    b = { bg = c.bg1, fg = c.fg },
    c = { bg = c.bg0, fg = c.grey1 },
  },
  visual = {
    a = { bg = c.yellow, fg = c.bg0, gui = "bold" },
    b = { bg = c.bg1, fg = c.fg },
    c = { bg = c.bg0, fg = c.grey1 },
  },
  replace = {
    a = { bg = c.red, fg = c.bg0, gui = "bold" },
    b = { bg = c.bg1, fg = c.fg },
    c = { bg = c.bg0, fg = c.grey1 },
  },
  inactive = {
    a = { bg = c.bg0, fg = c.grey1 },
    b = { bg = c.bg0, fg = c.grey1 },
    c = { bg = c.bg0, fg = c.grey1 },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = n0tch2k,
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
