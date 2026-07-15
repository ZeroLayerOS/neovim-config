-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = true -- relative line numbers, useful for jk motions
opt.wrap = false -- don't wrap long lines
opt.scrolloff = 8 -- keep 8 lines above/below the cursor
opt.cursorline = true -- highlight the current line

-- C / C++
vim.g.c_syntax_for_h = 1 -- treat .h files as C, not C++, by default

-- Python
vim.g.python3_host_prog = vim.fn.exepath("python3") -- use the python3 found in PATH
