return {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        border = {
          style = "rounded",
        },
        win_options = {
          -- winblend: 0 = fully opaque, higher = more see-through.
          -- Only visibly transparent if your terminal itself has
          -- background_opacity < 1 (kitty.conf).
          winblend = 20,
        },
      },
    },
  },
}
