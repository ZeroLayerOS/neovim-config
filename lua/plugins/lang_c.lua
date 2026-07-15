return {
  -- LSP: clangd
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            -- FIX: "ClangdSwitchSourceHeader" is an old command name that no longer exists.
            -- The current command provided by nvim-lspconfig is LspClangdSwitchSourceHeader
            { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          -- FIX: instead of root_dir + lspconfig.util.root_pattern (an older pattern that
          -- used to be copy-pasted everywhere), the current nvim-lspconfig (and LazyVim's
          -- own official extra) use root_markers. It's simpler, faster, and compatible
          -- with Neovim's newer native LSP API (0.11+).
          root_markers = {
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            "Makefile",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja",
            "CMakeLists.txt",
            ".git",
          },
          -- offsetEncoding was already correct (a table, not a string) — kept as is,
          -- it prevents the "multiple different client offset_encodings detected" warning
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },

  -- CMake support
  {
    "Civitasv/cmake-tools.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
      { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
      { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
    },
  },

  -- format code with clang-format via conform.nvim (already included with LazyVim)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },

  -- make sure the tools are installed via mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "cmake-language-server",
      },
    },
  },

  -- treesitter parsers for C/C++
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c", "cpp", "cmake" })
    end,
  },
}
