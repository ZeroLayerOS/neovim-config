return {
  -- 1. Core LSP configuration (rustaceanvim manages the rust-analyzer client
  -- itself; nvim-lspconfig is only kept here as a dependency for other
  -- language servers you configure elsewhere, not for Rust)
  {
    "neovim/nvim-lspconfig",
  },

  -- 2. Rust toolchain integration
  {
    "mrcjkb/rustaceanvim",
    -- FIX: pinned to v5, current major is v9 (checked GitHub releases:
    -- v9.0.5 is latest as of this edit). v5->v9 brings ~4 years of bug
    -- fixes/perf work; only breaking changes affect ra-multiplex/DAP
    -- config shapes, which you don't use here.
    version = "^9", -- pin to a major to avoid breaking changes
    -- Per upstream README: rustaceanvim implements its own lazy-loading
    -- via a ftplugin, so lazy=false is correct and intentional -- do not
    -- set ft = "rust" here, it would double-guard the same thing.
    lazy = false,
    -- FIX (real bug): the previous version configured vim.g.rustaceanvim
    -- inside `config`. `config` runs at plugin *load* time, which can
    -- race with rustaceanvim's own ftplugin/rust.lua depending on load
    -- order -- this is the exact scenario the plugin's own healthcheck
    -- warns about ("vim.g.rustaceanvim is set, but it was sourced after
    -- rustaceanvim was initialized"). `init` runs before the plugin is
    -- loaded, so the global is guaranteed to exist in time. This is the
    -- pattern used in rustaceanvim's own README and LazyVim's official
    -- Rust extra.
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            -- Hover actions (richer than plain hover: includes code
            -- actions inline, matches current README usage)
            map("n", "K", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, "Rust: Hover Actions")

            map("n", "<leader>ca", function()
              vim.cmd.RustLsp("codeAction")
            end, "Rust: Code Action")

            -- NOTE: removed the manual `gd` mapping. rustaceanvim attaches
            -- as a normal LSP client, and LazyVim's core LSP config
            -- already maps gd -> vim.lsp.buf.definition globally for every
            -- attached client. Re-mapping it per-buffer here was a no-op
            -- duplicate, not a bug, but dead weight.
          end,
        },
      }
    end,
  },
}
