return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  opts = {
    hide = {
      cursorline = false,
    },
    window = {
      margin = { horizontal = 1, vertical = 1 },
      padding = 1,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      if filename == "" then
        filename = "[No Name]"
      end
      local modified = vim.bo[props.buf].modified
      local icon, color = require("nvim-web-devicons").get_icon_color(filename)
      return {
        icon and { " " .. icon .. " ", guifg = color } or "",
        { filename .. " ", gui = modified and "bold,italic" or "bold" },
      }
    end,
  },
}
