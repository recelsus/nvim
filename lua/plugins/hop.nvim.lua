return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup {
      multi_windows = true,
    }
    
    vim.keymap.set("n", "<C-f>", "<cmd>HopWord<CR>", { noremap = true, silent = true, desc = "[Hop] Jump to Word" })
    vim.keymap.set("n", "<leader>ss", "<cmd>HopWord<CR>", { noremap = true, silent = true, desc = "[Hop] Jump to Word" })
    vim.keymap.set("n", "<leader>sp", "<cmd>HopPattern<CR>", { noremap = true, silent = true, desc = "[Hop] Jump to Pattern" })
    vim.keymap.set("n", "<leader>sv", "<cmd>HopVertical<CR>", { noremap = true, silent = true, desc = "[Hop] Jump Vertically" })
  end,
}
