return {
  {
    "navarasu/onedark.nvim", name = "onedark",
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      vim.cmd('colorscheme onedark')
    end
  },
  {
    "rose-pine/neovim", name = "rose-pine",
    config = function()
      -- vim.cmd('colorscheme rose-pine')
    end
  }
}
