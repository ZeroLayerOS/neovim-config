 return {
  -- LSP: basedpyright for types + ruff for linting/formatting
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        ruff = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = { only = { "source.organizeImports" }, diagnostics = {} },
                })
              end,
              desc = "Organize Imports (ruff)",
            },
          },
        },
      },
    },
  },

  -- Mason: make sure the Python tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
        "ruff",
        "debugpy",
      },
    },
  },

  -- Python formatting and linting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" },
      },
    },
  },

  -- treesitter parser for Python
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python", "toml" })
    end,
  },

  -- virtualenv management
  -- NOTE: the "regexp" branch was merged into main on 2025-08-27. Pinning it
  -- now pulls a stale, no-longer-updated branch — the plugin author's
  -- current guidance is to drop `branch` entirely and track main.
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {},
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
