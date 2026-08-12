-- ~/.config/nvim/lua/plugins/statusline.lua
-- lualine theme for "koda". Hex values here MUST equal the palette in
-- colorscheme.lua (bg0/bg2/fg/accent/red) so the statusline blends into
-- the rest of the UI instead of showing a seam against Normal/StatusLine.
-- lualine reads its own theme table (not global highlight groups), so
-- keeping these two files numerically in sync is what avoids the drift.
local c = {
  bg0   = "#101010", -- koda bg0  (main background)
  bg1   = "#272727", -- koda bg2  (statusline surface)
  fg    = "#f1f1ef", -- koda fg
  fg_dim = "#9aa0a6", -- koda fg_dim
  green = "#94b385", -- koda green (NORMAL mode)
  aqua  = "#eec278", -- koda accent/gold (INSERT mode — confirmed from theme reference)
  yellow = "#7ea3c9", -- koda blue (VISUAL mode)
  red   = "#f2666f", -- koda red (REPLACE mode)
  grey1 = "#9aa0a6", -- koda fg_dim
}

local koda = {
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
        theme = koda,
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
