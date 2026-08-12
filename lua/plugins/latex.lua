-- LaTeX support for Neovim on Linux.
--   * vimtex     -> compilation (latexmk), zathura preview, SyncTeX forward/
--                   inverse search, folding, TOC, cite/ref completion in insert mode
--   * texlab     -> LSP: diagnostics, go-to-definition, hover, symbol outline
--                   (build is left OFF here so it doesn't double-compile
--                   alongside vimtex/latexmk -- vimtex owns compilation)
--   * treesitter -> latex/bibtex parsers for syntax highlighting

return {
  ---------------------------------------------------------------------------
  -- vimtex
  ---------------------------------------------------------------------------
  {
    "lervag/vimtex",
    lazy = false, -- vimtex needs to load before a .tex file triggers its ftplugin
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
        },
      }

      -- keep vimtex's own quickfix/diagnostics quiet since texlab (LSP)
      -- will surface most of the same errors through vim.diagnostic
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_syntax_enabled = 0 -- let treesitter own highlighting instead

      -- fold via vimtex's own latex-aware folder (more accurate than
      -- generic treesitter folding for \section/\begin{}/\end{} pairs)
      vim.g.vimtex_fold_enabled = true
    end,
  },

  ---------------------------------------------------------------------------
  -- mason: make sure texlab is installed
  ---------------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "texlab" })
    end,
  },

  ---------------------------------------------------------------------------
  -- texlab LSP
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              build = {
                onSave = false, -- vimtex/latexmk handles building, not texlab
              },
              forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
              },
              chktex = {
                onOpenAndSave = true,
              },
            },
          },
        },
      },
    },
  },

  ---------------------------------------------------------------------------
  -- treesitter parsers
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "latex", "bibtex" })
    end,
  },
}
