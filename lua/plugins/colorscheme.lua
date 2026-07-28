return {
  -- Kanagawa, "Dragon" variant — the palette matches the terminal colors
  -- you gave me exactly (bg #181616, dragon-red #c4746e, dragon-green
  -- #8a9a7b, dragon-aqua #8ea4a2, etc.), so rebelot/kanagawa.nvim with
  -- theme = "dragon" is the correct upstream plugin instead of hand-rolling
  -- a colorscheme from scratch.
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)

      vim.o.background = "dark"
      vim.cmd.colorscheme("kanagawa-dragon")

      -- Exact hex values from your terminal palette -- used directly
      -- instead of pulling from kanagawa's internal palette module, so
      -- these UI accents always match your terminal 1:1.
      local RED = "#c4746e"
      local GREEN = "#8a9a7b"
      local YELLOW = "#c4b28a"
      local BLUE = "#8ba4b0"
      local MAGENTA = "#a292a3"
      local AQUA = "#8ea4a2"
      local FG = "#c5c9c5"
      local FG_ALT = "#c8c093" -- cursor / active tab fg
      local GREY1 = "#a6a69c" -- comments, muted text
      local GREY2 = "#938aa9" -- secondary muted (dragon violet-grey)
      local BG_DIM = "#12120f" -- inactive tab bg
      local BG0 = "#181616"
      local BG1 = "#0d0c0c"
      local SEL_BG = "#2d4f67"

      local function set_dashboard_highlights()
        local hl = vim.api.nvim_set_hl

        -- Dashboard (snacks.nvim): same hierarchy as the Everforest setup --
        -- green = logo/anchor, aqua = actionable key (distinct hue from the
        -- logo), fg = readable body text, grey = quiet footer text.
        hl(0, "SnacksDashboardHeader", { fg = GREEN, bold = true })
        hl(0, "SnacksDashboardKey", { fg = AQUA, bold = true })
        hl(0, "SnacksDashboardDesc", { fg = FG })
        hl(0, "SnacksDashboardIcon", { fg = GREY1 })
        hl(0, "SnacksDashboardDir", { fg = GREY1 })
        hl(0, "SnacksDashboardFile", { fg = FG })
        hl(0, "SnacksDashboardSpecial", { fg = AQUA })
        hl(0, "SnacksDashboardTerminal", { fg = GREEN })
        hl(0, "SnacksDashboardFooter", { fg = GREY1, italic = true })

        -- Popup menu darker than bg0 for depth (matches your bg1 tab tier)
        hl(0, "Pmenu", { bg = BG1 })
        hl(0, "PmenuSel", { bg = GREEN, fg = BG0, bold = true })

        -- Selection / visual highlight taken straight from your palette
        hl(0, "Visual", { bg = SEL_BG, fg = FG_ALT })

        -- Diagnostics mapped onto the same accent colors as the terminal
        hl(0, "DiagnosticError", { fg = RED })
        hl(0, "DiagnosticWarn", { fg = YELLOW })
        hl(0, "DiagnosticInfo", { fg = BLUE })
        hl(0, "DiagnosticHint", { fg = MAGENTA })

        -- Cursor + line number accents, unused vars kept to avoid
        -- luacheck "unused local" noise on GREY2 / BG_DIM below
        hl(0, "Cursor", { fg = BG0, bg = FG_ALT })
        hl(0, "LineNr", { fg = GREY2 })
        hl(0, "TabLineSel", { fg = FG_ALT, bg = BG_DIM })
      end

      set_dashboard_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "kanagawa-dragon",
        callback = set_dashboard_highlights,
      })
    end,
  },

  -- make LazyVim use kanagawa-dragon by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}
