-- ~/.config/nvim/lua/config/colorscheme.lua
-- "koda" — a minimal, low-saturation dark theme.
-- Self-contained: no external "koda" plugin dependency. All hex values
-- below were sampled directly from the reference screenshot (editor,
-- statusline, popup menu). Extended UI accents (green/blue for modes)
-- were not present in the screenshot and are harmonized additions —
-- see the comment on each one.
--
-- Kept in sync with statusline.lua: bg0/bg1/fg/accent/red below MUST
-- match the `c` table in statusline.lua, or the lualine bar will visibly
-- seam against the editor UI.

local koda = {}

---@class KodaPalette
local palette = {
  dark = {
    -- backgrounds (surfaces, dark -> light)
    bg0 = "#101010", -- editor/popup background            [sampled]
    bg1 = "#161616", -- sign column / subtle recessed areas [derived, +1 step from bg0]
    bg2 = "#272727", -- cursorline / pmenu-sel / statusline [sampled]
    bg3 = "#333333", -- borders / separators                [derived, +1 step from bg2]

    -- foregrounds
    fg       = "#f1f1ef", -- keywords, calls, bold text, "ID" badge, active linenr [sampled]
    fg_dim   = "#9aa0a6", -- types, punctuation, identifiers/params, inactive linenr [sampled]
    fg_muted = "#5c6773", -- comments, hints                                        [sampled]

    -- accents
    accent = "#eec278", -- strings, numbers, matched-text, INSERT mode, warnings [sampled]
    red    = "#f2666f", -- diagnostics/error, REPLACE mode, deletions           [sampled]
    green  = "#94b385", -- NORMAL mode, additions   [harmonized addition — not in screenshot]
    blue   = "#7ea3c9", -- VISUAL mode, info/hints  [harmonized addition — not in screenshot]
  },
}

---Apply a full highlight table in one pass (fast: one C call per group,
---executed once at startup, no autocmds/timers involved).
---@param colors KodaPalette
local function apply_highlights(colors)
  local hl = vim.api.nvim_set_hl
  local c = colors

  local groups = {
    -- ===== Editor UI =====
    Normal          = { fg = c.fg_dim, bg = c.bg0 },
    NormalNC        = { fg = c.fg_dim, bg = c.bg0 },
    NormalFloat     = { fg = c.fg_dim, bg = c.bg1 },
    FloatBorder     = { fg = c.bg3, bg = c.bg1 },
    FloatTitle      = { fg = c.accent, bg = c.bg1, bold = true },

    Cursor          = { fg = c.bg0, bg = c.fg },
    CursorLine      = { bg = c.bg2 },
    CursorLineNr    = { fg = c.fg, bold = true },
    CursorLineFold  = { bg = c.bg2 },
    CursorLineSign  = { bg = c.bg2 },
    LineNr          = { fg = c.fg_dim },
    SignColumn      = { fg = c.fg_dim, bg = c.bg0 },
    ColorColumn     = { bg = c.bg1 },

    VertSplit       = { fg = c.bg3, bg = c.bg0 },
    WinSeparator    = { fg = c.bg3, bg = c.bg0 },
    WinBar          = { fg = c.fg_dim, bg = c.bg0 },
    WinBarNC        = { fg = c.fg_muted, bg = c.bg0 },

    StatusLine      = { fg = c.fg, bg = c.bg2 },
    StatusLineNC    = { fg = c.fg_muted, bg = c.bg2 },
    TabLine         = { fg = c.fg_muted, bg = c.bg1 },
    TabLineSel      = { fg = c.fg, bg = c.bg2, bold = true },
    TabLineFill     = { bg = c.bg1 },

    Pmenu           = { fg = c.fg_dim, bg = c.bg0 },
    PmenuSel        = { fg = c.fg, bg = c.bg2, bold = true },
    PmenuSbar       = { bg = c.bg1 },
    PmenuThumb      = { bg = c.fg_dim },
    PmenuBorder     = { fg = c.bg3, bg = c.bg0 },
    PmenuKind       = { fg = c.fg_dim, bg = c.bg0 },
    PmenuKindSel    = { fg = c.fg_dim, bg = c.bg2 },
    PmenuExtra      = { fg = c.fg_muted, bg = c.bg0 },
    PmenuExtraSel   = { fg = c.fg_muted, bg = c.bg2 },

    Visual          = { bg = c.bg2 },
    VisualNOS       = { bg = c.bg2 },
    Search          = { fg = c.bg0, bg = c.accent },
    IncSearch       = { fg = c.bg0, bg = c.accent, bold = true },
    CurSearch       = { fg = c.bg0, bg = c.accent, bold = true },
    MatchParen      = { fg = c.accent, bold = true },

    NonText         = { fg = c.bg3 },
    EndOfBuffer     = { fg = c.bg3 },
    Whitespace      = { fg = c.bg3 },
    Folded          = { fg = c.fg_muted, bg = c.bg1 },
    FoldColumn      = { fg = c.fg_muted, bg = c.bg0 },
    Directory       = { fg = c.accent },
    Title           = { fg = c.accent, bold = true },

    ModeMsg         = { fg = c.fg, bold = true },
    MoreMsg         = { fg = c.accent },
    Question        = { fg = c.accent },
    WarningMsg      = { fg = c.accent },
    ErrorMsg        = { fg = c.red, bold = true },

    -- ===== Classic syntax groups =====
    Comment         = { fg = c.fg_muted },
    Constant        = { fg = c.accent },
    String          = { fg = c.accent },
    Character       = { fg = c.accent },
    Number          = { fg = c.accent },
    Boolean         = { fg = c.accent },
    Float           = { fg = c.accent },
    Identifier      = { fg = c.fg_dim },
    Function        = { fg = c.fg, bold = true },
    Statement       = { fg = c.fg, bold = true },
    Conditional     = { fg = c.fg, bold = true },
    Repeat          = { fg = c.fg, bold = true },
    Label           = { fg = c.fg },
    Operator        = { fg = c.fg_dim },
    Keyword         = { fg = c.fg, bold = true },
    Exception       = { fg = c.red, bold = true },
    PreProc         = { fg = c.blue },
    Include         = { fg = c.blue },
    Define          = { fg = c.blue },
    Macro           = { fg = c.blue },
    PreCondit       = { fg = c.blue },
    Type            = { fg = c.fg_dim },
    StorageClass    = { fg = c.fg, bold = true },
    Structure       = { fg = c.fg_dim },
    Typedef         = { fg = c.fg_dim },
    Special         = { fg = c.accent },
    SpecialChar     = { fg = c.accent },
    Tag             = { fg = c.fg_dim },
    Delimiter       = { fg = c.fg_dim },
    SpecialComment  = { fg = c.fg_muted, italic = true },
    Debug           = { fg = c.red },
    Underlined      = { fg = c.fg, underline = true },
    Ignore          = { fg = c.bg3 },
    Error           = { fg = c.red, bold = true },
    Todo            = { fg = c.bg0, bg = c.accent, bold = true },

    -- ===== Treesitter (@ groups) =====
    ["@variable"]            = { fg = c.fg_dim },
    ["@variable.builtin"]    = { fg = c.fg, italic = true },
    ["@variable.parameter"]  = { fg = c.fg_dim },
    ["@variable.member"]     = { fg = c.fg_dim },
    ["@constant"]             = { fg = c.accent },
    ["@constant.builtin"]     = { fg = c.accent, bold = true },
    ["@module"]                = { fg = c.fg_dim },
    ["@string"]               = { fg = c.accent },
    ["@string.escape"]        = { fg = c.accent, bold = true },
    ["@string.special"]       = { fg = c.accent },
    ["@character"]            = { fg = c.accent },
    ["@number"]                = { fg = c.accent },
    ["@boolean"]               = { fg = c.accent },
    ["@function"]              = { fg = c.fg, bold = true },
    ["@function.call"]         = { fg = c.fg, bold = true },
    ["@function.builtin"]      = { fg = c.fg, bold = true },
    ["@method"]                = { fg = c.fg, bold = true },
    ["@method.call"]           = { fg = c.fg, bold = true },
    ["@constructor"]           = { fg = c.fg_dim },
    ["@keyword"]               = { fg = c.fg, bold = true },
    ["@keyword.function"]      = { fg = c.fg, bold = true },
    ["@keyword.return"]        = { fg = c.fg, bold = true },
    ["@keyword.operator"]      = { fg = c.fg_dim },
    ["@keyword.import"]        = { fg = c.fg, bold = true },
    ["@conditional"]           = { fg = c.fg, bold = true },
    ["@repeat"]                = { fg = c.fg, bold = true },
    ["@operator"]              = { fg = c.fg_dim },
    ["@punctuation.bracket"]   = { fg = c.fg_dim },
    ["@punctuation.delimiter"] = { fg = c.fg_dim },
    ["@punctuation.special"]   = { fg = c.accent },
    ["@comment"]               = { fg = c.fg_muted },
    ["@type"]                  = { fg = c.fg_dim },
    ["@type.builtin"]          = { fg = c.fg_dim, italic = true },
    ["@property"]              = { fg = c.fg_dim },
    ["@field"]                  = { fg = c.fg_dim },
    ["@tag"]                    = { fg = c.fg_dim },
    ["@tag.attribute"]         = { fg = c.accent },
    ["@tag.delimiter"]         = { fg = c.fg_muted },

    -- ===== LSP semantic tokens (fallback to TS colors) =====
    ["@lsp.type.class"]     = { link = "@type" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"]  = { link = "@property" },
    ["@lsp.type.variable"]  = { link = "@variable" },

    -- ===== Diagnostics =====
    DiagnosticError            = { fg = c.red },
    DiagnosticWarn             = { fg = c.accent },
    DiagnosticInfo             = { fg = c.blue },
    DiagnosticHint              = { fg = c.fg_muted },
    DiagnosticOk                = { fg = c.green },
    DiagnosticUnderlineError    = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.accent },
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.blue },
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.fg_muted },
    DiagnosticVirtualTextError  = { fg = c.red },
    DiagnosticVirtualTextWarn   = { fg = c.accent },
    DiagnosticVirtualTextInfo   = { fg = c.blue },
    DiagnosticVirtualTextHint   = { fg = c.fg_muted },
    DiagnosticSignError          = { fg = c.red },
    DiagnosticSignWarn           = { fg = c.accent },
    DiagnosticSignInfo           = { fg = c.blue },
    DiagnosticSignHint           = { fg = c.fg_muted },

    -- ===== Diff / gitsigns =====
    DiffAdd     = { fg = c.green, bg = c.bg1 },
    DiffChange  = { fg = c.accent, bg = c.bg1 },
    DiffDelete  = { fg = c.red, bg = c.bg1 },
    DiffText    = { fg = c.fg, bg = c.bg1 },
    GitSignsAdd     = { fg = c.green },
    GitSignsChange  = { fg = c.accent },
    GitSignsDelete  = { fg = c.red },

    -- ===== nvim-cmp =====
    CmpItemAbbrDefault      = { fg = c.fg_dim },
    CmpItemAbbrMatch        = { fg = c.accent, bold = true },
    CmpItemAbbrMatchFuzzy   = { fg = c.accent, bold = true },
    CmpItemAbbrDeprecated   = { fg = c.fg_muted, strikethrough = true },
    CmpItemKindDefault      = { fg = c.fg_dim },
    CmpItemMenu             = { fg = c.fg_muted },

    -- ===== blink.cmp =====
    BlinkCmpMenu           = { fg = c.fg_dim, bg = c.bg0 },
    BlinkCmpMenuBorder     = { fg = c.bg3, bg = c.bg0 },
    BlinkCmpMenuSelection  = { fg = c.fg, bg = c.bg2, bold = true },
    BlinkCmpLabel          = { fg = c.fg_dim },
    BlinkCmpLabelMatch     = { fg = c.accent, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.fg_muted, strikethrough = true },
    BlinkCmpKind           = { fg = c.fg_dim },

    -- ===== Telescope (kept minimal on purpose) =====
    TelescopeNormal    = { fg = c.fg_dim, bg = c.bg0 },
    TelescopeBorder    = { fg = c.bg3, bg = c.bg0 },
    TelescopeSelection = { fg = c.fg, bg = c.bg2, bold = true },
    TelescopeMatching  = { fg = c.accent, bold = true },
    TelescopePromptPrefix = { fg = c.accent },
  }

  for group, opts in pairs(groups) do
    hl(0, group, opts)
  end
end

---Load a koda variant.
---@param variant "dark"
function koda.load(variant)
  local colors = palette[variant]
  if not colors then
    vim.notify(
      ("koda: unknown variant '%s' (only 'dark' is implemented)"):format(tostring(variant)),
      vim.log.levels.ERROR
    )
    return
  end

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "koda"

  apply_highlights(colors)
end

-- ---------------------------------------------------------------------
-- lazy.nvim spec
-- ---------------------------------------------------------------------
-- This file lives under lua/plugins/, a directory lazy.nvim scans
-- automatically and expects every file to `return` a plugin spec (a
-- table or array of tables), never an arbitrary module table.
--
-- `koda` above is a plain Lua module (a table with a `.load` function),
-- not a plugin spec — returning it directly is what produced:
--   Invalid plugin spec { load = <function 1> }
-- because lazy.nvim tried to read `load` as a spec field it doesn't
-- recognize. The fix: wrap it in a minimal local "fake" plugin entry
-- and only call koda.load() from inside `config`, which lazy.nvim runs
-- at the correct point in startup (after options/keymaps, once this
-- entry is due to load) instead of at spec-parse time.
--
-- `dir = vim.fn.stdpath("config")` points lazy.nvim at your existing
-- config folder (always present, nothing to git-clone) — the standard
-- trick for registering a colorscheme that lives inline in your config
-- rather than as a separate plugin repo.
return {
  {
    "koda",
    dir = vim.fn.stdpath("config"),
    name = "koda",
    lazy = false,
    priority = 1000, -- load before other UI plugins (e.g. lualine)
    config = function()
      koda.load("dark")
    end,
  },
}
