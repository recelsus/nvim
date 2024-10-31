return {
  {
    "petertriho/nvim-scrollbar",
    dependencies = { "kevinhwang91/nvim-hlslens" },  
    event = "BufReadPre",
    config = function()
      require("scrollbar").setup({
        show = true,
        handle = {
          color = "#6b6b6b",
        },
        marks = {
          Search = { color = "#FFD700" },  
          Error = { color = "#FF4500" },   
          Warn  = { color = "#FFA500" },   
          Info  = { color = "#00FF00" },   
          Hint  = { color = "#1E90FF" },   
        },
        handlers = {
          diagnostic = true,  
          search = true,      
        },
      })

      require("scrollbar.handlers.search").setup({
        calm_down = true,  
      })
    end
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require('hlslens').setup({
        calm_down = true,
        nearest_only = true,  
        nearest_float_when = 'always',  
      })

      vim.cmd([[
        nnoremap n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
        nnoremap N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
        nnoremap * *<Cmd>lua require('hlslens').start()<CR>
        nnoremap # #<Cmd>lua require('hlslens').start()<CR>
        nnoremap g* g*<Cmd>lua require('hlslens').start()<CR>
        nnoremap g# g#<Cmd>lua require('hlslens').start()<CR>
      ]])
    end
  }
}
