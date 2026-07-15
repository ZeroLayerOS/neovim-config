return {
  -- file explorer
  -- {
  --"nvim-neo-tree/neo-tree.nvim",
  --branch = "v3.x",
  --dependencies = {
  -- "nvim-lua/plenary.nvim",
  --"nvim-tree/nvim-web-devicons",
  --"MunifTanjim/nui.nvim",
  --},
  --keys = {
  -- { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
  --},
  --opts = {},
  --},

  -- shows keymaps as you type
  {
    "folke/which-key.nvim",
    opts = {},
  },

  -- automatically closes brackets
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- quickly comment lines
  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = {
      { "gcc", mode = "n", desc = "Comment line" },
      { "gc", mode = "v", desc = "Comment selection" },
    },
  },

  -- jump between any two characters on screen
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
}
