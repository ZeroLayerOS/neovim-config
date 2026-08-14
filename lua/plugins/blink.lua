-- ~/.config/nvim/lua/plugins/blink.lua
-- Single source of truth for blink.cmp behavior:
--   - ghost text (inline AI-style preview) stays OFF
--   - completion menu DOES auto-show while typing (this is the normal
--     "list of suggestions under the cursor" popup, not ghost text)
return {
  {
    "saghen/blink.cmp",
    version = "*",
    opts = {
      completion = {
        -- keep ghost text off: no faint inline AI-style suggestion
        -- appearing next to the cursor as you type
        ghost_text = { enabled = false },

        -- but DO show the real completion menu automatically
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
        },
        menu = {
          auto_show = true,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
    },
  },
}
