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
        icons = {
          separator = "=>",
          group = "",
        }
      }
      wk.add({ "<leader>s", hidden = true })
      wk.add({ "<leader>e", desc = "Show Diagnostic", icon = "" }) 
      wk.add({ "<leader>f", group = "Telescope", icon = ""}) 
      wk.add({ "<leader>g", desc = "Git", icon = "" }) 
      wk.add({ "<leader>t", desc = "Translator", icon = "" }) 
    end,
  }
}
