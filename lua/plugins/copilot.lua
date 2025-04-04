return {
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_enabled = false

      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      vim.g.copilot_filetypes = {
        lua = true,
        javascript = true,
        typescript = true,
        cpp = true,
        python = true,
        ["*"] = false,
      }

      vim.api.nvim_create_user_command("CopilotToggle", function()
        if vim.g.copilot_enabled == nil or vim.g.copilot_enabled == false then
          vim.cmd("Copilot enable")
          vim.g.copilot_enabled = true
          print("Copilot enabled")
        else
          vim.cmd("Copilot disable")
          vim.g.copilot_enabled = false
          print("Copilot disabled")
        end
      end, {})
      
      vim.keymap.set("n", "<C-l>", "<Nop>", { noremap = true, silent = true, desc = "Disable default <C-i> behavior" })
      vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true, desc = "[Copilot] Accept Suggestion" })

      vim.keymap.set("n", "<leader>ct", ':CopilotToggle<CR>', { silent = true, noremap = true, desc = "[Copilot] Toggle" })
    end,
  },
}

