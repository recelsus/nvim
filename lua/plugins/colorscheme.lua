return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      vim.cmd('colorscheme onedark')
    end
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   config = function()
  --     -- vim.cmd('colorscheme rose-pine')
  --   end
  -- }
}
