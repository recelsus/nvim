return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } 
    },
    event = "BufReadPre",
    config = function()
      local telescope = require("telescope")
      
      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            "^.git",
            "^.cache",
            "^Library",
            "node_modules/.*"
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-uu",
          },
          mappings = {
          --  i = {
          --    ["<C-j>"] = "move_selection_next",
          --    ["<C-k>"] = "move_selection_previous",
          --  },
          --  n = {
          --    ["<C-j>"] = "move_selection_next",
          --    ["<C-k>"] = "move_selection_previous",
          --  },
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        }
      })
      local builtin = require("telescope.builtin")      
      
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true, desc = "[Telescope] Find Files" })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true, desc = "[Telescope] Live Grep (Text Search)" })
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true, desc = "[Telescope] List Buffers" })
      vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true, desc = "[Telescope] Search Help Tags" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { noremap = true, silent = true, desc = "[Telescope] Search Keymaps" })

      telescope.load_extension("fzf")
    end
  }
}

