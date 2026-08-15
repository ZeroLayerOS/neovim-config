return {
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        -- تقدر تسيبها فاضية كده وتستخدم الإعدادات الافتراضية
      })
      vim.cmd.colorscheme("kanagawa-paper")
    end,
  },
  -- خلي LazyVim يعرف إن ده الكولورسكيم الافتراضي دلوقتي
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-paper",
    },
  },
}
