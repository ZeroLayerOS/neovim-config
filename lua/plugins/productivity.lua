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

  -- REMOVED: numToStr/Comment.nvim.
  -- LazyVim has shipped nvim-mini/mini.comment as its default comment
  -- plugin since v3.0 (native comments on Neovim >= 0.10, which you're
  -- on). gcc / gc already work out of the box through it, with
  -- treesitter-aware commentstring built in. Adding Comment.nvim on top
  -- loaded a second plugin doing the exact same job -- extra startup
  -- cost for zero functional gain, and a real (if usually silent) risk
  -- of the two fighting over the gc/gcc keymaps depending on load order.
  -- If you want to see current keymaps: <leader>sk then search "comment".

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
