return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        size = function(term)
          if term.direction == "horizontal" then
            return math.floor(vim.o.lines * 0.3)
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          end
        end,

        open_mapping = [[<C-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "single",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal
    end,
  },    
}
