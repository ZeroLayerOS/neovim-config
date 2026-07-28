return {
  "folke/twilight.nvim",
  cmd = "Twilight",
  opts = {
    dimming = {
      alpha = 0.25,
      inactive = false,
    },
    context = 12, -- lines of context around the active scope to keep undimmed
  },
  keys = {
    { "<leader>uT", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  },
}
