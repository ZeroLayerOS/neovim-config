-- ~/.config/nvim/lua/guts/init.lua
-- "guts" — dark theme, colors sourced from the upstream guts_nvim
-- palette/theme README rather than sampled from a screenshot, so this
-- file only decides which UI/syntax GROUP gets which semantic ROLE from
-- theme.lua. Never write a raw hex string below — go through theme.lua
-- (which goes through palette.lua) so statusline.lua and this file can
-- never drift apart the way the old koda setup warned about.
local theme = require("guts.theme")
local terminal = require("guts.terminal")

local guts = {}

---Semantic role -> highlight groups. Mirrors the reference screenshot:
--   snow_gray (keyword)     def/class/if/return/import/from, booleans-as-keywords
--   griffith_purple (func)  function & method names, both def and call sites
--   casca_pink (special)    self/cls, dunder names — "special language features"
--   campfire (entity)       class names at definition, decorators, warnings
--   night_sky_blue (type)   type annotations, builtin types, class-as-type usage
--   night_sky_green (param) parameters, self.attr / obj.attr members
--   eclipse_pink (constant) True/False/None, numeric & boolean literals, enums
--   cliff_green (string)    strings, f-strings, paths
--   fg_subtle                plain/uncategorized identifiers, statusline text
--   fg_muted                 comments, borders, line numbers
local function apply_highlights(c)
  local hl = vim.api.nvim_set_hl

  local groups = {
    -- ===== Editor UI =====
    Normal = { fg = c.fg_subtle, bg = c.bg },
    NormalNC = { fg = c.fg_subtle, bg = c.bg },
    NormalFloat = { fg = c.fg_subtle, bg = c.bg_alt },
    FloatBorder = { fg = c.fg_muted, bg = c.bg_alt },
    FloatTitle = { fg = c.function_name, bg = c.bg_alt, bold = true },

    Cursor = { fg = c.bg, bg = c.fg },
    CursorLine = { bg = c.bg_alt },
    CursorLineNr = { fg = c.fg, bold = true },
    CursorLineFold = { bg = c.bg_alt },
    CursorLineSign = { bg = c.bg_alt },
    LineNr = { fg = c.fg_muted },
    SignColumn = { fg = c.fg_muted, bg = c.bg },
    ColorColumn = { bg = c.bg_alt },

    VertSplit = { fg = c.fg_muted, bg = c.bg },
    WinSeparator = { fg = c.fg_muted, bg = c.bg },
    WinBar = { fg = c.fg_subtle, bg = c.bg },
    WinBarNC = { fg = c.fg_muted, bg = c.bg },

    StatusLine = { fg = c.fg_subtle, bg = c.bg_alt },
    StatusLineNC = { fg = c.fg_muted, bg = c.bg_alt },
    TabLine = { fg = c.fg_muted, bg = c.bg_alt },
    TabLineSel = { fg = c.fg, bg = c.bg_alt, bold = true },
    TabLineFill = { bg = c.bg_alt },

    Pmenu = { fg = c.fg_subtle, bg = c.bg },
    PmenuSel = { fg = c.fg, bg = c.bg_alt, bold = true },
    PmenuSbar = { bg = c.bg_alt },
    PmenuThumb = { bg = c.fg_muted },
    PmenuBorder = { fg = c.fg_muted, bg = c.bg },
    PmenuKind = { fg = c.fg_subtle, bg = c.bg },
    PmenuKindSel = { fg = c.fg_subtle, bg = c.bg_alt },
    PmenuExtra = { fg = c.fg_muted, bg = c.bg },
    PmenuExtraSel = { fg = c.fg_muted, bg = c.bg_alt },

    Visual = { bg = c.fg_muted },
    VisualNOS = { bg = c.fg_muted },
    -- search matches use the two dedicated "highlight" greens, fg=bg for contrast
    Search = { fg = c.bg, bg = c.highlight },
    IncSearch = { fg = c.bg, bg = c.highlight_strong, bold = true },
    CurSearch = { fg = c.bg, bg = c.highlight_strong, bold = true },
    MatchParen = { fg = c.highlight, bold = true },

    NonText = { fg = c.fg_muted },
    EndOfBuffer = { fg = c.fg_muted },
    Whitespace = { fg = c.fg_muted },
    Folded = { fg = c.fg_muted, bg = c.bg_alt },
    FoldColumn = { fg = c.fg_muted, bg = c.bg },
    Directory = { fg = c.string }, -- "strings, directories" per README
    Title = { fg = c.function_name, bold = true },

    ModeMsg = { fg = c.fg, bold = true },
    MoreMsg = { fg = c.string },
    Question = { fg = c.string },
    WarningMsg = { fg = c.entity },
    ErrorMsg = { fg = c.error, bold = true },

    -- ===== Classic syntax groups (fallback for filetypes without a TS parser) =====
    Comment = { fg = c.fg_muted, italic = true },
    Constant = { fg = c.constant },
    String = { fg = c.string },
    Character = { fg = c.string },
    Number = { fg = c.constant },
    Boolean = { fg = c.constant, bold = true },
    Float = { fg = c.constant },
    Identifier = { fg = c.fg_subtle },
    Function = { fg = c.function_name, bold = true },
    Statement = { fg = c.keyword, bold = true },
    Conditional = { fg = c.keyword, bold = true },
    Repeat = { fg = c.keyword, bold = true },
    Label = { fg = c.keyword },
    Operator = { fg = c.fg },
    Keyword = { fg = c.keyword, bold = true },
    Exception = { fg = c.error, bold = true },
    PreProc = { fg = c.entity },
    Include = { fg = c.keyword, bold = true },
    Define = { fg = c.entity },
    Macro = { fg = c.entity },
    PreCondit = { fg = c.entity },
    Type = { fg = c.type },
    StorageClass = { fg = c.keyword, bold = true },
    Structure = { fg = c.entity },
    Typedef = { fg = c.type },
    Special = { fg = c.special },
    SpecialChar = { fg = c.special },
    Tag = { fg = c.entity },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.fg_muted, italic = true },
    Debug = { fg = c.error },
    Underlined = { fg = c.fg, underline = true },
    Ignore = { fg = c.fg_muted },
    Error = { fg = c.error, bold = true },
    Todo = { fg = c.bg, bg = c.constant, bold = true },

    -- ===== Treesitter (@ groups) =====
    ["@variable"] = { fg = c.fg_subtle },
    ["@variable.builtin"] = { fg = c.special, italic = true }, -- self/cls
    ["@variable.parameter"] = { fg = c.parameter },
    ["@variable.member"] = { fg = c.parameter }, -- obj.attr / self.attr
    ["@constant"] = { fg = c.constant },
    ["@constant.builtin"] = { fg = c.constant, bold = true }, -- True/False/None
    ["@module"] = { fg = c.fg_subtle },
    ["@string"] = { fg = c.string },
    ["@string.escape"] = { fg = c.string, bold = true },
    ["@string.special"] = { fg = c.string },
    ["@string.special.path"] = { fg = c.string, underline = true },
    ["@character"] = { fg = c.string },
    ["@number"] = { fg = c.constant },
    ["@boolean"] = { fg = c.constant, bold = true },
    ["@function"] = { fg = c.function_name, bold = true },
    ["@function.call"] = { fg = c.function_name },
    ["@function.builtin"] = { fg = c.function_name, italic = true },
    ["@function.method"] = { fg = c.function_name, bold = true },
    ["@function.method.call"] = { fg = c.function_name },
    ["@constructor"] = { fg = c.entity },
    ["@keyword"] = { fg = c.keyword, bold = true },
    ["@keyword.function"] = { fg = c.keyword, bold = true },
    ["@keyword.return"] = { fg = c.keyword, bold = true },
    ["@keyword.operator"] = { fg = c.keyword },
    ["@keyword.import"] = { fg = c.keyword, bold = true },
    ["@conditional"] = { fg = c.keyword, bold = true },
    ["@repeat"] = { fg = c.keyword, bold = true },
    ["@operator"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.special },
    ["@comment"] = { fg = c.fg_muted, italic = true },
    ["@attribute"] = { fg = c.entity }, -- decorators: @dataclass
    ["@type"] = { fg = c.type },
    ["@type.builtin"] = { fg = c.type, italic = true },
    ["@property"] = { fg = c.parameter },
    ["@field"] = { fg = c.parameter },
    ["@tag"] = { fg = c.entity },
    ["@tag.attribute"] = { fg = c.parameter },
    ["@tag.delimiter"] = { fg = c.fg_muted },

    -- ===== LSP semantic tokens (fall back to Treesitter's roles) =====
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.readonly"] = { link = "@constant" },
    -- don't let LSP semantic tokens fight Treesitter for the common cases
    ["@lsp.type.function"] = {},
    ["@lsp.type.method"] = {},
    ["@lsp.type.enumMember"] = { link = "@constant" },

    -- ===== Diagnostics =====
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.entity },
    DiagnosticInfo = { fg = c.type },
    DiagnosticHint = { fg = c.fg_muted },
    DiagnosticOk = { fg = c.string },
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.entity },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.type },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.fg_muted },
    DiagnosticVirtualTextError = { fg = c.error },
    DiagnosticVirtualTextWarn = { fg = c.entity },
    DiagnosticVirtualTextInfo = { fg = c.type },
    DiagnosticVirtualTextHint = { fg = c.fg_muted },
    DiagnosticSignError = { fg = c.error },
    DiagnosticSignWarn = { fg = c.entity },
    DiagnosticSignInfo = { fg = c.type },
    DiagnosticSignHint = { fg = c.fg_muted },

    -- ===== Diff / gitsigns =====
    DiffAdd = { bg = c.diff_add },
    DiffChange = { fg = c.entity, bg = c.bg_alt },
    DiffDelete = { bg = c.diff_delete },
    DiffText = { fg = c.fg, bg = c.bg_alt },
    GitSignsAdd = { fg = c.string },
    GitSignsChange = { fg = c.entity },
    GitSignsDelete = { fg = c.error },

    -- ===== nvim-cmp =====
    CmpItemAbbrDefault = { fg = c.fg_subtle },
    CmpItemAbbrMatch = { fg = c.highlight, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.highlight, bold = true },
    CmpItemAbbrDeprecated = { fg = c.fg_muted, strikethrough = true },
    CmpItemKindDefault = { fg = c.fg_subtle },
    CmpItemMenu = { fg = c.fg_muted },

    -- ===== blink.cmp =====
    BlinkCmpMenu = { fg = c.fg_subtle, bg = c.bg },
    BlinkCmpMenuBorder = { fg = c.fg_muted, bg = c.bg },
    BlinkCmpMenuSelection = { fg = c.fg, bg = c.bg_alt, bold = true },
    BlinkCmpLabel = { fg = c.fg_subtle },
    BlinkCmpLabelMatch = { fg = c.highlight, bold = true },
    BlinkCmpLabelDeprecated = { fg = c.fg_muted, strikethrough = true },
    BlinkCmpKind = { fg = c.fg_subtle },

    -- ===== Telescope (kept minimal on purpose) =====
    TelescopeNormal = { fg = c.fg_subtle, bg = c.bg },
    TelescopeBorder = { fg = c.fg_muted, bg = c.bg },
    TelescopeSelection = { fg = c.fg, bg = c.bg_alt, bold = true },
    TelescopeMatching = { fg = c.highlight, bold = true },
    TelescopePromptPrefix = { fg = c.function_name },
  }

  for group, opts in pairs(groups) do
    hl(0, group, opts)
  end
end

---Load the guts colorscheme (dark only, matching upstream).
function guts.load()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "guts"

  apply_highlights(theme)
  terminal.load(theme)
end

return guts
