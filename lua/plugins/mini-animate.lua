 return {
  "nvim-mini/mini.animate",
  event = "VeryLazy",
  opts = function()
    return {
      cursor = { enable = true },
      scroll = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
      },
      resize = { enable = true },
      -- window open/close animations off by default -- mostly noise with
      -- LazyVim's float-heavy UI (Telescope, Lazy, etc.)
      open = { enable = false },
      close = { enable = false },
    }
  end,
}
