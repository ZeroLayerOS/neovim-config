-- Same Nord hex values as colorscheme.lua, so lualine matches the
-- terminal/editor palette 1:1 instead of drifting to a different theme.
local c = {
  bg0 = "#2e3440", -- nord0 background
  bg1 = "#3b4252", -- nord1 (statusline bg)
  fg = "#e5e9f0", -- nord5 foreground
  green = "#a3be8c", -- nord14 (normal mode)
  aqua = "#88c0d0", -- nord8  (insert mode)
  yellow = "#ebcb8b", -- nord13 (visual mode)
  red = "#bf616a", -- nord11 -- the signature coral red (replace mode)
  grey1 = "#d8dee9", -- nord4
}

local nord = {
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
        theme = nord,
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
