return {
  {
    "echasnovski/mini.indentscope",
    version = false,
    config = function()
      require('mini.indentscope').setup({
        
        symbol = '│', 
        options = {
          try_as_border = true,  
        },
        draw = {
          delay = 100,  
          animation = require('mini.indentscope').gen_animation.none() 
        }
      })
      
      vim.cmd([[ highlight MiniIndentscopeSymbol guifg=#E5C07B ]])  
    end
  }
}

