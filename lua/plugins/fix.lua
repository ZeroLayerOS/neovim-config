return {
  {
    "saghen/blink.cmp",
    -- Use a fixed release with a prebuilt binary instead of building it locally
    -- (this is still the correct, current approach; if you have a Rust toolchain
    -- set up and want to build locally, remove `version` and enable the line below)
    -- build = "cargo build --release",
    version = "*",
    opts = {
      completion = {
        -- hide ghost text (the faint inline preview text next to the cursor)
        ghost_text = { enabled = false },

        -- FIX: this is what was actually missing for a real "no autocomplete" setup.
        -- Without these settings, the suggestion menu was still popping up
        -- automatically while typing (auto-trigger), even with ghost_text disabled.
        -- Now the menu will only appear when you press the default keybind
        -- <C-space> manually, while LSP stays fully functional (hover, diagnostics,
        -- go-to-definition, etc.) without suggestions popping up as you type.
        trigger = {
          show_on_keyword = false,
          show_on_trigger_character = false,
        },
        menu = {
          auto_show = false,
        },
        -- optional: also stop the documentation popup from showing automatically
        documentation = {
          auto_show = false,
        },
      },
    },
  },
}
