 return {
  -- file icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- indentation guide lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
      },
    },
  },

  -- highlight hex colors
  -- NOTE: norcalli/nvim-colorizer.lua is unmaintained (no responses on issues
  -- in years). catgoose/nvim-colorizer.lua is the actively maintained fork,
  -- same zero-config setup() API.
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- highlight TODO and FIXME comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
