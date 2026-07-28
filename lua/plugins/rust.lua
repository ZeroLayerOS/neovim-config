return {
  -- 1. Core LSP configuration
  {
    "neovim/nvim-lspconfig",
  },

  -- 2. Rust toolchain integration
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }

            -- ✅ التعديل هنا: استخدام hover فقط بدلاً من hover actions
            vim.keymap.set("n", "K", function()
              vim.cmd.RustLsp("hover")
            end, opts)

            -- Code Actions
            vim.keymap.set("n", "<leader>ca", function()
              vim.cmd.RustLsp("codeAction")
            end, opts)

            -- Go to definition
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          end,
        },
      }
    end,
  },
}
