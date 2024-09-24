return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      local wk = require("which-key")

      wk.setup {
        triggers = {
         { "<auto>", mode = "nixsotc" },
          -- { "<leader>", mode = { "n", "v" } },
        },
      }
      wk.add({ "<leader>s", hidden = true })
      wk.add({ "<leader>f", group = "Telescope" }) 
      wk.add({ "<leader>e", desc = "Show Diagnostic" }) 
    end,
  }
}

