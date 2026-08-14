return {
  {
    "guts",
    dir = vim.fn.stdpath("config"),
    name = "guts",
    lazy = false,
    priority = 1000,
    config = function()
      require("guts").load()
    end,
  },
}
