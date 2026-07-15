return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "sainnhe/everforest" },
    opts = {
      options = {
        -- lualine ships an official "everforest" built-in theme (matches
        -- statusline1/2/3 from the colorscheme's own palette), so no need
        -- to hand-roll one like we did for the custom accent version.
        theme = "everforest",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          { "diagnostics", symbols = { error = " ", warn = " ", hint = "󰠠 ", info = " " } },
        },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
