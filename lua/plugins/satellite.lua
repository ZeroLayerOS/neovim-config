return {
  "lewis6991/satellite.nvim",
  event = "BufReadPost",
  opts = {
    current_only = false,
    winblend = 30,
    handlers = {
      cursor = { enable = true },
      search = { enable = true },
      diagnostic = { enable = true },
      gitsigns = { enable = true }, -- needs gitsigns.nvim (already in LazyVim core)
      marks = { enable = true },
    },
  },
}
