# Ember Slate
![License](https://img.shields.io/badge/license-MIT-de6145)
![Lua](https://img.shields.io/badge/Lua-100%25-343d41)
![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-9fa5a9)

A dark, minimal Neovim colorscheme built around a deep slate background with a single warm ember-orange accent. Designed to match a coordinated terminal setup (kitty, btop, cava) for a consistent look across the whole desktop.

A dark, minimal Neovim colorscheme built around a deep slate background with a single warm ember-orange accent. Designed to match a coordinated terminal setup (kitty, btop, cava) for a consistent look across the whole desktop.

## Preview

- **Background:** `#101315` — deep, near-black slate
- **Foreground:** `#cacccc` — soft off-white
- **Accent:** `#de6145` — warm ember orange, used for keywords, functions, and highlights
- **Supporting grays:** `#343d41`, `#565d60`, `#798186`, `#9fa5a9`, `#a5aeb4`, `#d9dbdc`
![Ember Slate Preview](./screenshot.png)

## Installation

### Using lazy.nvim

Place the colorscheme file at:
~/.config/nvim/lua/custom-theme/colors/ember-slate.lua

Then add a plugin spec:

```lua
return {
  {
    "custom-theme",
    dir = vim.fn.stdpath("config") .. "/lua/custom-theme",
    name = "custom-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme ember-slate")
    end,
  },
}
```

## Highlight Groups Covered

* Core UI: `Normal`, `CursorLine`, `LineNr`, `Visual`, `Search`, `StatusLine`, `Pmenu`
* Syntax: `Comment`, `String`, `Function`, `Keyword`, `Type`, `Special`, `Error`
* Diff: `DiffAdd`, `DiffChange`, `DiffDelete`, `DiffText`
* Diagnostics: `DiagnosticError`, `DiagnosticWarn`, `DiagnosticInfo`, `DiagnosticHint`

## Philosophy

Ember Slate avoids multi-color syntax highlighting in favor of a restrained palette: mostly grayscale tones for structure and readability, with the ember-orange accent reserved for what actually matters — keywords, functions, and anything that needs your attention.

## Companion Themes

This colorscheme is part of a matching set:

* **kitty** — terminal emulator theme
* **btop** — system monitor theme
* **cava** — audio visualizer gradient

## License

MIT
