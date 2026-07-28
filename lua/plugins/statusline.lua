 -- Same exact hex values used in colorscheme.lua (kanagawa-dragon), so
-- lualine matches the terminal/editor palette 1:1 instead of drifting from
-- the leftover "everforest" theme that no longer matches your colorscheme.
local c = {
  bg0 = "#181616",
  bg1 = "#0d0c0c",
  fg = "#c5c9c5",
  green = "#8a9a7b",
  aqua = "#8ea4a2",
  yellow = "#c4b28a",
  red = "#c4746e",
  grey1 = "#a6a69c",
}

local kanagawa_dragon = {
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
        theme = kanagawa_dragon,
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
