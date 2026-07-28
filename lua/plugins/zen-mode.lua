return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      width = 0.85,
      options = {
        number = true,
        relativenumber = true,
      },
    },
    plugins = {
      -- Twilight is auto-enabled while Zen Mode is active if it's installed
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
  },
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
}
