-- lualine config, theme-agnostic.
-- Previously this hardcoded `local c = require("guts.theme")` and built
-- a custom theme table from guts' colors directly -- that meant lualine
-- stayed tied to guts even after switching to kanagawa-paper as the
-- active colorscheme. `theme = "auto"` tells lualine to detect and
-- adapt to whichever colorscheme is currently active, so switching
-- colorschemes (guts, kanagawa-paper, or anything else later) no
-- longer requires touching this file.
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
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
