return {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        border = {
          style = "rounded",
        },
        -- REMOVED: winblend = 20 (transparency). winblend > 0 makes the
        -- popup blend with whatever is behind it -- opaque (0) is both
        -- what you asked for and marginally cheaper to composite.
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
