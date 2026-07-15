# 💤 LazyVim — C & Python Edition (Catppuccin Mocha)

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim), customized for
**C/C++** and **Python** development, themed with **Catppuccin Mocha**.

## ما الجديد في الإعداد ده

- **الثيم:** Catppuccin Mocha (Dark) بدل gruvbox-material.
- **C/C++:** clangd, clang-format, cmake-tools, codelldb للـ debugging.
- **Python:** basedpyright (LSP), ruff (lint + format), debugpy للـ debugging.
- **Debugging موحد:** nvim-dap + nvim-dap-ui يشتغلوا مع C و Python (ومع Rust لو لسه محتاجه).
- **Mason:** بيركب تلقائيًا كل الأدوات المطلوبة (clangd, codelldb, debugpy, ruff,...).

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## بنية المشروع

```
.
├── init.lua
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── colorscheme.lua      -- Catppuccin Mocha
│       ├── debugging.lua        -- DAP (C / Python / Rust)
│       ├── lang_c.lua           -- C/C++ tooling
│       ├── lang_python.lua      -- Python tooling
│       ├── productivity.lua
│       ├── statusline.lua
│       └── ui.lua
```
