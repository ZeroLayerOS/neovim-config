-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- quick-run the current file (C or Python) in an integrated terminal
map("n", "<leader>rr", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")
  if ft == "python" then
    vim.cmd("split | terminal python3 " .. file)
  elseif ft == "c" then
    local out = vim.fn.expand("%:p:r")
    vim.cmd("split | terminal gcc " .. file .. " -o " .. out .. " && " .. out)
  elseif ft == "cpp" then
    local out = vim.fn.expand("%:p:r")
    vim.cmd("split | terminal g++ " .. file .. " -o " .. out .. " && " .. out)
  else
    vim.notify("No quick-run configured for filetype: " .. ft, vim.log.levels.WARN)
  end
end, { desc = "Run Current File" })
