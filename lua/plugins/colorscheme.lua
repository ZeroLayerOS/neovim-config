-- Theme rebuilt from the official Nord palette (verified against the
-- canonical base16-nord mapping used by tinted-theming / kitty-themes --
-- this is the standard, widely-adopted base16 <-> Nord translation, not
-- an invented one).
--
-- ABOUT THIS PALETTE: unlike N0tch2k (which is a near-monochrome
-- khaki/grunge palette with no real blue or purple), Nord is a proper
-- arctic, bluish palette with genuine distinct hues for every base16
-- accent slot -- including a real blue (nord9/nord10) and a real
-- purple/magenta (nord15). Nothing here is reused or faked: every
-- base08-base0F slot below maps 1:1 to an actual named Nord color.
--
-- The signature "coral red" accent people usually mean when they say
-- "Nord with a distinct red" is nord11 (#BF616A) -- that's base08 below,
-- used for errors/variables/diagnostics, same role it plays in Nord's
-- own reference palette.
--
-- Why base16-pro-max.nvim (unchanged from before):
--   * Derives Treesitter captures, LSP semantic tokens, and plugin
--     integrations (mini.nvim, blink.cmp, gitsigns, which-key, flash,
--     lualine, ...) from just the 16 base colors.
--   * Cached recompute -- no real startup cost over a static colorscheme.
--
-- NOTE: pair this with disable-semantic-tokens.lua. rust-analyzer/clangd
-- semantic tokens still take priority over Treesitter regardless of the
-- palette, and will wash colors out to base05 again if left enabled --
-- that's a separate, unrelated mechanism from which palette is loaded.
return {
  {
    "y3owk1n/base16-pro-max.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Every value below is a literal Nord color (Polar Night / Snow
      -- Storm / Frost / Aurora), matched to base16 slots using the
      -- standard base16-nord scheme -- nothing invented, nothing reused
      -- across slots the way N0tch2k needed for its missing hues.
      colors = {
        base00 = "#2e3440", -- nord0  background          (Polar Night)
        base01 = "#3b4252", -- nord1  statusline / line-nr bg (Polar Night)
        base02 = "#434c5e", -- nord2  selection bg         (Polar Night)
        base03 = "#4c566a", -- nord3  comments             (Polar Night, brightest)
        base04 = "#d8dee9", -- nord4  dark fg / status bar (Snow Storm)
        base05 = "#e5e9f0", -- nord5  foreground           (Snow Storm)
        base06 = "#eceff4", -- nord6  light fg             (Snow Storm, brightest)
        base07 = "#8fbcbb", -- nord7  active_tab_foreground (Frost, teal-tinted bright accent)
        base08 = "#bf616a", -- nord11 red       (variables, errors) -- the signature coral red
        base09 = "#d08770", -- nord12 orange    (numbers, constants)
        base0A = "#ebcb8b", -- nord13 yellow    (classes/types)
        base0B = "#a3be8c", -- nord14 green     (strings)
        base0C = "#88c0d0", -- nord8  cyan      (regex/escapes) -- real Frost cyan
        base0D = "#81a1c1", -- nord9  blue      (functions) -- real Frost blue, no reuse needed
        base0E = "#b48ead", -- nord15 magenta/purple (keywords) -- real Aurora purple, no reuse needed
        base0F = "#5e81ac", -- nord10 deep blue (deprecated / embedded-lang tags)
      },

      styles = {
        italic = true,
        bold = true,
        transparency = false,
        dim_inactive_windows = true,
      },

      -- Sets vim.g.terminal_color_0..15 so :terminal buffers match your
      -- Nord terminal palette.
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
