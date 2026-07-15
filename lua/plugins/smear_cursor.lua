return {
  "sphamba/smear-cursor.nvim",
  -- Optional improvement (not a bug fix): taken from LazyVim's official smear-cursor
  -- extra. event = "VeryLazy" makes the plugin load a bit lazier instead of at startup,
  -- and cond disables it automatically when running inside Neovide (which already has
  -- its own smooth cursor).
  event = "VeryLazy",
  cond = vim.g.neovide == nil,
  opts = {
    stiffness = 0.95,
    trailing_stiffness = 0.25,
    damping = 0.65,
    distance_stop_animating = 0.1,
    cursor_color = "#ffffff",
  },
}
