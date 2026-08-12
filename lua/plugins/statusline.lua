 -- Same hemisu hex values as colorscheme.lua, so lualine matches the
-- terminal/editor palette 1:1 instead of drifting to a different theme.
--
-- Naming note: the "yellow" slot below is hemisu's `accent4` (a warm
-- tan, #ECE1C8) rather than a true yellow -- hemisu's dark palette has
-- no real yellow, and tan is the closest warm accent it has, so it's
-- used for visual mode instead of forcing an unrelated color in.
local c = {
  bg0 = "#000000", -- hemisu bg (black)
  bg1 = "#111111", -- hemisu faint (statusline bg)
  fg = "#EEEEEE", -- hemisu norm (foreground)
  green = "#B1D631", -- hemisu accent2 (normal mode) -- same green as String/Keyword
  aqua = "#CBE4EE", -- hemisu lightBlue (insert mode)
  yellow = "#ECE1C8", -- hemisu accent4 / tan (visual mode) -- see naming note above
  red = "#D65E76", -- hemisu normRed (replace mode)
  grey1 = "#BBBBBB", -- hemisu lightGrey
}

local hemisu = {
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
        theme = hemisu,
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
