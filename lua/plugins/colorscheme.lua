-- Theme rebuilt from the N0tch2k terminal palette (verified against the
-- official kitty-themes repo / Remmina port -- your posted hex values
-- matched it exactly).
--
-- IMPORTANT ABOUT THIS PALETTE: N0tch2k is a deliberately low-saturation,
-- almost-monochrome "khaki/grunge" theme. Its ANSI cyan (#c9c9c9) and
-- magenta (#767676/#a3a3a3) slots are just grey -- there is no real blue
-- or purple anywhere in it. That's a property of the palette, not a bug
-- in this mapping: code will read as more tonal (browns/greens/greys)
-- and less rainbow than something like Tokyo Night, by design.
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
      -- Every value below is a literal N0tch2k ANSI/UI color -- nothing
      -- invented. Where base16 needs a slot N0tch2k has no equivalent for
      -- (base0D "blue", base0E "magenta"), the nearest distinct color in
      -- the existing palette is reused rather than introducing a foreign
      -- hue -- see the mapping notes per line.
      colors = {
        base00 = "#222222", -- background
        base01 = "#383838", -- color0            (statusline / line-nr bg)
        base02 = "#474747", -- color8            (selection bg)
        base03 = "#767676", -- color5            (comments)
        base04 = "#666666", -- color2            (dark fg, status bar)
        base05 = "#a0a0a0", -- foreground
        base06 = "#d8c8bb", -- color15           (light fg)
        base07 = "#eeeeee", -- active_tab_foreground (brightest fg)
        base08 = "#a95551", -- color1  red       (variables, errors)
        base09 = "#a98051", -- color3  orange    (numbers, constants)
        base0A = "#a99175", -- color11 yellow    (classes/types)
        base0B = "#98bd5e", -- color12 green     (strings) -- most saturated color N0tch2k has
        base0C = "#c9c9c9", -- color6  "cyan"    (regex/escapes -- actually neutral grey in this theme)
        base0D = "#657d3e", -- color4  "blue"    (functions) -- N0tch2k has no blue; reused the
        --                                          darker olive so it reads distinct from base0B's
        --                                          brighter green instead of picking a random hue
        base0E = "#a97775", -- color9  "magenta" (keywords) -- N0tch2k has no magenta; nearest
        --                                          distinct warm tone from base08's red
        base0F = "#d0b8a3", -- color7  brown     (deprecated / embedded-lang tags)
      },

      styles = {
        italic = true,
        bold = true,
        transparency = false,
        dim_inactive_windows = true,
      },

      -- Sets vim.g.terminal_color_0..15 so :terminal buffers match your
      -- kitty N0tch2k palette.
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
