return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "InsertEnter",
    config = function()
      require('colorizer').setup({
        '*';
      }, {
        RGB      = true;  
        RRGGBB   = true;  
        names    = true;  
        RRGGBBAA = true;  
        rgb_fn   = true;  
        hsl_fn   = true;  
        css      = true;  
        css_fn   = true;  
      })

      vim.cmd[[ ColorizerAttachToBuffer ]]
    end
  }
}

