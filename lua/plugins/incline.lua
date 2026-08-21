-- ~/.config/nvim/lua/plugins/incline.lua
-- Enhanced incline.nvim winbar: filename + icon, git branch, LSP
-- diagnostic counts, and cursor position.
return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    hide = {
      cursorline = false,
    },
    window = {
      margin = { horizontal = 1, vertical = 1 },
      padding = 1,
      zindex = 50,
    },
    render = function(props)
      local bufname = vim.api.nvim_buf_get_name(props.buf)
      local filename = vim.fn.fnamemodify(bufname, ":t")
      if filename == "" then
        filename = "[No Name]"
      end
      local modified = vim.bo[props.buf].modified

      local icon, color = require("nvim-web-devicons").get_icon_color(filename)

      local result = {}

      if icon then
        table.insert(result, { " " .. icon .. " ", guifg = color })
      end
      table.insert(result, {
        filename,
        gui = modified and "bold,italic" or "bold",
      })
      if modified then
        table.insert(result, { " ●", guifg = "#e0af68" })
      end

      local git_branch = vim.b[props.buf].incline_git_branch
      if git_branch and git_branch ~= "" then
        table.insert(result, { "  " })
        table.insert(result, { " " .. git_branch, guifg = "#7aa2f7" })
      end

      local diagnostics = vim.diagnostic.get(props.buf)
      local counts = { error = 0, warn = 0 }
      for _, d in ipairs(diagnostics) do
        if d.severity == vim.diagnostic.severity.ERROR then
          counts.error = counts.error + 1
        elseif d.severity == vim.diagnostic.severity.WARN then
          counts.warn = counts.warn + 1
        end
      end
      if counts.error > 0 then
        table.insert(result, { "  " })
        table.insert(result, { " " .. counts.error, guifg = "#f7768e" })
      end
      if counts.warn > 0 then
        table.insert(result, { "  " })
        table.insert(result, { " " .. counts.warn, guifg = "#e0af68" })
      end

      if props.focused then
        local cursor = vim.api.nvim_win_get_cursor(props.win)
        table.insert(result, { "  " })
        table.insert(result, {
          cursor[1] .. ":" .. (cursor[2] + 1),
          guifg = "#565f89",
        })
      end

      return result
    end,
  },
  config = function(_, opts)
    require("incline").setup(opts)

    -- FIX: setting vim.b[buf].incline_git_branch alone doesn't make
    -- incline re-render -- incline only redraws on its own tracked
    -- events (cursor move, buffer change, etc). We force a redraw by
    -- firing a CursorMoved autocmd for the affected buffer's window
    -- once the git branch lookup returns, so the branch shows up
    -- without waiting for the user to move the cursor manually.
    local function refresh_incline(buf)
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
          vim.api.nvim_exec_autocmds("CursorMoved", { buffer = buf })
        end
      end
    end

    local function update_git_branch(buf)
      buf = buf or vim.api.nvim_get_current_buf()
      local bufname = vim.api.nvim_buf_get_name(buf)
      if bufname == "" then
        return
      end
      local dir = vim.fn.fnamemodify(bufname, ":h")
      vim.system({ "git", "-C", dir, "rev-parse", "--abbrev-ref", "HEAD" }, { text = true }, function(res)
        if res.code == 0 then
          local branch = vim.trim(res.stdout or "")
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(buf) then
              vim.b[buf].incline_git_branch = branch
              refresh_incline(buf)
            end
          end)
        end
      end)
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufEnter" }, {
      callback = function(args)
        update_git_branch(args.buf)
      end,
    })

    -- also refresh incline whenever diagnostics change, so error/warn
    -- counts update live instead of only on cursor move
    vim.api.nvim_create_autocmd("DiagnosticChanged", {
      callback = function(args)
        refresh_incline(args.buf)
      end,
    })
  end,
}
