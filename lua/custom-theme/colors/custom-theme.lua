vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "custom-theme"

local colors = {
  bg = "#101315",
  fg = "#cacccc",
  gray1 = "#343d41",
  gray2 = "#565d60",
  gray3 = "#798186",
  gray4 = "#9fa5a9",
  gray5 = "#a5aeb4",
  gray6 = "#d9dbdc",
  accent = "#de6145",
  select_bg = "#a3a6a7",
}

local hl = vim.api.nvim_set_hl

hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg })
hl(0, "CursorLine", { bg = colors.gray1 })
hl(0, "CursorLineNr", { fg = colors.accent, bold = true })
hl(0, "LineNr", { fg = colors.gray2 })
hl(0, "Visual", { bg = colors.select_bg, fg = colors.bg })
hl(0, "Search", { bg = colors.accent, fg = colors.bg })
hl(0, "IncSearch", { bg = colors.gray6, fg = colors.bg })
hl(0, "StatusLine", { fg = colors.fg, bg = colors.gray1 })
hl(0, "StatusLineNC", { fg = colors.gray2, bg = colors.gray1 })
hl(0, "VertSplit", { fg = colors.gray1 })
hl(0, "Pmenu", { fg = colors.fg, bg = colors.gray1 })
hl(0, "PmenuSel", { fg = colors.bg, bg = colors.accent })

-- Syntax
hl(0, "Comment", { fg = colors.gray2, italic = true })
hl(0, "Constant", { fg = colors.gray6 })
hl(0, "String", { fg = colors.gray5 })
hl(0, "Identifier", { fg = colors.gray4 })
hl(0, "Function", { fg = colors.accent, bold = true })
hl(0, "Statement", { fg = colors.accent })
hl(0, "Keyword", { fg = colors.accent, bold = true })
hl(0, "Type", { fg = colors.gray6 })
hl(0, "Special", { fg = colors.accent })
hl(0, "PreProc", { fg = colors.gray5 })
hl(0, "Title", { fg = colors.fg, bold = true })
hl(0, "Underlined", { fg = colors.accent, underline = true })
hl(0, "Error", { fg = colors.accent, bold = true })
hl(0, "Todo", { fg = colors.bg, bg = colors.accent, bold = true })

-- Diff
hl(0, "DiffAdd", { fg = colors.gray5, bg = colors.gray1 })
hl(0, "DiffChange", { fg = colors.gray4, bg = colors.gray1 })
hl(0, "DiffDelete", { fg = colors.accent, bg = colors.gray1 })
hl(0, "DiffText", { fg = colors.gray6, bg = colors.gray1 })

-- Diagnostics
hl(0, "DiagnosticError", { fg = colors.accent })
hl(0, "DiagnosticWarn", { fg = colors.gray5 })
hl(0, "DiagnosticInfo", { fg = colors.gray4 })
hl(0, "DiagnosticHint", { fg = colors.gray3 })
