 -- Custom theme built directly from your kitty terminal palette.
--
-- This new palette (bg #24221c, fg #d4b07b, the warm olive/gold ANSI
-- colors, active/inactive tab colors, macos_titlebar_color) is a
-- *kitty.conf* color scheme, not a match for Kanagawa or any other
-- shipped colorscheme -- so hand-rolling from base16-pro-max.nvim
-- (instead of reusing an upstream theme + patching it, like the old
-- kanagawa.nvim setup did) is the right move here.
--
-- Why base16-pro-max.nvim instead of writing highlight groups by hand:
--   * It derives Treesitter captures, LSP semantic tokens, and 10+
--     plugin integrations (mini.nvim, blink.cmp, gitsigns, which-key,
--     flash, telescope, fzf, render-markdown, lualine, ...) from just
--     the 16 base colors, so we don't need a manual nvim_set_hl() pass
--     like the previous file did for the dashboard.
--   * It only recomputes highlights that actually change (cached),
--     which keeps startup cost effectively the same as a static
--     colorscheme -- good for LazyVim's lazy=false/priority=1000 path.
return {
  {
    "y3owk1n/base16-pro-max.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- base00-base05, base07-base0F below are your literal kitty hex
      -- values. Your palette only defines 16 ANSI colors + bg/fg, but
      -- base16 needs a few extra UI shades (base02, base04, base06)
      -- that kitty has no slot for -- those three are interpolated
      -- between their neighbours so they stay inside your exact hue
      -- range instead of introducing a foreign color.
      colors = {
        base00 = "#24221c", -- background
        base01 = "#2b2922", -- active_tab_background   (status-bar-ish bg)
        base02 = "#3a362a", -- derived: base01 -> color0/8 (selection bg)
        base03 = "#87765d", -- color7 / color15            (comments)
        base04 = "#ad936c", -- derived: color7 -> foreground (dark fg)
        base05 = "#d4b07b", -- foreground
        base06 = "#e1cfb4", -- derived: foreground -> active_tab_foreground
        base07 = "#eeeeee", -- active_tab_foreground        (brightest fg)
        base08 = "#e56b55", -- color1 / color9   red
        base09 = "#e18245", -- color3            orange
        base0A = "#e5a440", -- color11           yellow (bright)
        base0B = "#99b05f", -- color2 / color10  green
        base0C = "#bfab36", -- color6 / color14  "cyan" slot (olive-gold in your theme)
        base0D = "#949fb4", -- color4 / color12  blue
        base0E = "#d261a5", -- color5 / color13  magenta
        base0F = "#825230", -- derived brown (deprecated/paths -- kitty has no slot for this)
      },

      styles = {
        italic = true,
        bold = true,
        transparency = false,
        dim_inactive_windows = true, -- mirrors inactive_tab_background being darker than bg
      },

      -- Sets vim.g.terminal_color_0..15 to your exact ANSI values, so
      -- :terminal buffers inside Neovim match your kitty palette 1:1
      -- instead of falling back to base16-pro-max's derived guesses.
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
