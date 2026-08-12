-- hemisu palette (dark variant), mapped onto base16-pro-max.nvim.
--
-- Source of truth: the uploaded hemisu.vim colorscheme by Noah Frederick
-- (`&background == "dark"` branch). Every hex below is copied directly
-- from that file's `s:...` color definitions and how they're actually
-- used in its `s:h(...)` highlight calls -- credit to the original
-- author for the palette itself.
--
-- Mapping notes (so nothing here is asserted without a reason):
--   base00-base01  bg / faint bg      -> hemisu's `bg` and `faint`
--   base02         selection bg       -> hemisu's `faintBlue`, which is
--                                        literally what Visual/PmenuSel use
--   base03-base05  comment/dim/fg     -> hemisu's `comment`, `dimmed`, `norm`
--   base06-base07  light fg/bg        -> hemisu's unused `lightGrey`/`white`
--                                        (defined in the file but not
--                                        wired to a highlight group in the
--                                        dark branch, so treated as spare)
--   base08         red/errors         -> `normRed`, used for Todo/SpellBad
--   base09         constants/numbers  -> `accent1`, used via Directory/Constant/Number
--   base0A         classes            -> `accent3`, used for Type/Statement
--   base0B         strings            -> `accent2`, hemisu's actual String color
--   base0C         support/regex      -> `lightBlue`, defined in the file but
--                                        only wired up in the light branch --
--                                        borrowed here since dark has no 2nd blue
--   base0D         functions/headings -> `accent4`, used for Title
--   base0E         keywords           -> `accent2` reused, hemisu's actual Keyword color
--   base0F         deprecated         -> `faintRed`, used for ErrorMsg bg
--
-- Why base16-pro-max.nvim (unchanged):
--   * Derives Treesitter captures, LSP semantic tokens, and plugin
--     integrations (mini.nvim, blink.cmp, gitsigns, which-key, flash,
--     lualine, ...) from just the 16 base colors.
--   * Cached recompute -- no real startup cost over a static colorscheme.
return {
  {
    "y3owk1n/base16-pro-max.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        base00 = "#000000", -- bg               (hemisu `bg` / black)
        base01 = "#111111", -- lighter bg        (hemisu `faint` / almostBlack)
        base02 = "#005F87", -- selection bg      (hemisu `faintBlue` -- Visual/PmenuSel bg)
        base03 = "#777777", -- comments          (hemisu `comment` / middleDarkGrey)
        base04 = "#999999", -- dark fg / statusbar (hemisu `dimmed` -- StatusLineNC fg)
        base05 = "#EEEEEE", -- foreground        (hemisu `norm` / almostWhite)
        base06 = "#BBBBBB", -- light fg          (hemisu `lightGrey`, spare/unused slot)
        base07 = "#FFFFFF", -- light bg          (hemisu `white`, spare/unused slot)

        base08 = "#D65E76", -- red      (hemisu `normRed` -- Todo/SpellBad)
        base09 = "#9FD3E6", -- orange   (hemisu `accent1` -- Constant/Number/Special/PreProc)
        base0A = "#BBFFAA", -- yellow   (hemisu `accent3` -- Type/Statement)
        base0B = "#B1D631", -- green    (hemisu `accent2` -- String, exact match)
        base0C = "#CBE4EE", -- cyan     (hemisu `lightBlue` -- unused in dark branch, borrowed)
        base0D = "#ECE1C8", -- blue     (hemisu `accent4` -- Title/headings)
        base0E = "#B1D631", -- magenta  (hemisu `accent2` reused -- Keyword, exact match)
        base0F = "#63001C", -- deprecated (hemisu `faintRed` -- ErrorMsg bg)
      },

      styles = {
        italic = true, -- hemisu sets Comment to gui=italic
        bold = true, -- Keyword/Title/StatusLine/Todo use gui=bold
        transparency = false,
        dim_inactive_windows = true,
      },

      -- Sets vim.g.terminal_color_0..15 so :terminal buffers match.
      setup_globals = {
        terminal_colors = true,
      },

      plugins = {
        enable_all = true,
      },
    },
    config = function(_, opts)
      require("base16-pro-max").setup(opts)
      vim.o.background = "dark"
      vim.cmd.colorscheme("base16-pro-max")
    end,
  },

  -- make LazyVim use this colorscheme by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "base16-pro-max",
    },
  },
}
