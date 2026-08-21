return {
  "nvim-mini/mini.animate",
  event = "VeryLazy",
  opts = function()
    return {
      cursor = { enable = true },
      -- FIX: scroll animation was making large jumps (G, gg, Ctrl-D/U,
      -- or any big jump in visual mode) feel laggy -- the screen would
      -- animate through every intermediate line instead of jumping
      -- straight there, which is what "بيعلق وينزل حتة حتة" was
      -- describing. Disabled scroll animation entirely; cursor/resize
      -- animations (small, local movements) are unaffected and stay on.
      scroll = {
        enable = false,
      },
      resize = { enable = true },
      open = { enable = false },
      close = { enable = false },
    }
  end,
}
