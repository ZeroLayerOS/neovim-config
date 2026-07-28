return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged" },
  opts = {},
  config = function(_, opts)
    require("auto-save").setup(opts)

    -- NOTE: execution_message was removed from this fork. The current way
    -- to show a save notification is hooking the AutoSaveWritePost User
    -- event yourself (per the plugin's README).
    local group = vim.api.nvim_create_augroup("autosave_notify", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      group = group,
      callback = function(ev)
        if ev.data.saved_buffer ~= nil then
          vim.notify("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO)
        end
      end,
    })
  end,
}
