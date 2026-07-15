return {
  -- Everforest, "hard" contrast = the deepest dark background this
  -- colorscheme offers (bg_dim #1E2326 / bg0 #272E33).
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_disable_italic_comment = 0
      vim.g.everforest_diagnostic_text_highlight = 1
      vim.g.everforest_diagnostic_virtual_text = "colored"
      vim.g.everforest_ui_contrast = "low"
      vim.g.everforest_better_performance = 1

      vim.o.background = "dark"
      vim.cmd.colorscheme("everforest")

      -- Real Everforest hard-dark palette (from sainnhe/everforest's own
      -- palette.md) -- no synthetic accent this time, the colorscheme's
      -- own green/aqua/grey tones ARE the theme.
      local GREEN = "#A7C080"
      local AQUA = "#83C092"
      local FG = "#D3C6AA"
      local GREY1 = "#859289" -- comments, muted text
      local GREY2 = "#9DA9A0" -- slightly brighter muted
      local BG_DIM = "#1E2326"
      local BG1 = "#2E383C"

      local function set_dashboard_highlights()
        local hl = vim.api.nvim_set_hl

        -- Dashboard (snacks.nvim): same deliberate hierarchy as before --
        -- green = the logo/anchor, aqua = the actionable key (distinct hue
        -- so it doesn't blend into the logo), fg = readable body text,
        -- grey = quiet supporting/footer text.
        hl(0, "SnacksDashboardHeader", { fg = GREEN, bold = true })
        hl(0, "SnacksDashboardKey", { fg = AQUA, bold = true })
        hl(0, "SnacksDashboardDesc", { fg = FG })
        hl(0, "SnacksDashboardIcon", { fg = GREY2 })
        hl(0, "SnacksDashboardDir", { fg = GREY2 })
        hl(0, "SnacksDashboardFile", { fg = FG })
        hl(0, "SnacksDashboardSpecial", { fg = AQUA })
        hl(0, "SnacksDashboardTerminal", { fg = GREEN })
        hl(0, "SnacksDashboardFooter", { fg = GREY1, italic = true })

        -- Popup menu slightly darker than bg0 for depth (bg_dim tier)
        hl(0, "Pmenu", { bg = BG1 })
        hl(0, "PmenuSel", { bg = GREEN, fg = BG_DIM, bold = true })
      end

      set_dashboard_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "everforest",
        callback = set_dashboard_highlights,
      })
    end,
  },

  -- make LazyVim use everforest by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
