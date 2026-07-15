-- IMPORTANT FIX:
-- Your lazy.lua already imports:
--   lazyvim.plugins.extras.dap.core     -> sets up nvim-dap + nvim-dap-ui + all <leader>d.. keymaps
--   lazyvim.plugins.extras.lang.clangd  -> sets up codelldb for C/C++ automatically
--   lazyvim.plugins.extras.lang.python  -> sets up debugpy for Python automatically (via mason-nvim-dap)
--
-- The old version of this file used a full `config = function() ... end` for the
-- "mfussenegger/nvim-dap" plugin. That is a problem: when multiple plugin specs for the
-- same plugin each define their own `config` function, lazy.nvim does NOT merge them —
-- only one of them actually runs, depending on load order. That means the setup done by
-- dap.core (dapui listeners, keymaps, etc.) or by the clangd extra (codelldb) can silently
-- get overridden or skipped. This is exactly the kind of conflict that causes breakpoints
-- to show up as "Rejected", a well known issue in the LazyVim community.
--
-- The correct/current approach used across the LazyVim community is to extend the plugin
-- with an `opts` function that performs side effects (mutating `require("dap")` directly)
-- instead of a full `config` override, so it merges with the extras instead of replacing
-- them. C/C++ and Python are already fully covered by the extras above, so this file now
-- only adds what is NOT covered: Rust support.

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- codelldb should already be registered by extras.lang.clangd.
      -- This guard just protects against the case where that extra is disabled.
      if not dap.adapters.codelldb then
        dap.adapters.codelldb = {
          type = "server",
          host = "localhost", -- was missing in the previous version
          port = "${port}",
          executable = {
            command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
            args = { "--port", "${port}" },
          },
        }
      end

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            local cargo_toml = vim.fn.getcwd() .. "/Cargo.toml"
            if vim.fn.filereadable(cargo_toml) == 1 then
              for _, line in ipairs(vim.fn.readfile(cargo_toml)) do
                local name = line:match('^name%s*=%s*"(.+)"')
                if name then
                  return vim.fn.getcwd() .. "/target/debug/" .. name
                end
              end
            end
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          sourceLanguages = { "rust" },
        },
      }
    end,
  },
}
