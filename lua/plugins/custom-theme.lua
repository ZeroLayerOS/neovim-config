return {
  {
    "custom-theme",
    dir = vim.fn.stdpath("config") .. "/lua/custom-theme",
    name = "custom-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme custom-theme")
    end,
  },
}
