return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup {
      multi_windows = true,
    }
  end,
  keys = {
    {mode = "", "<leader>s", "<cmd>HopWord<CR>", desc = "Move Target"},
  }
}
