return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
        },

        -- ハイライトを新しい方式で設定
        on_attach = function()
          -- Add highlights
          vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
          vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
          vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })

          -- Change highlights
          vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
          vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
          vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })

          -- Changedelete highlights
          vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChangeDelete' })
          vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
          vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })

          -- Delete highlights
          vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
          vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
          vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })

          -- Topdelete highlights
          vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
          vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
          vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
        end,

        watch_gitdir = {
          interval = 1000,
        },

        current_line_blame = true, -- 現在行の git blame を表示
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
        },
      })
    end
  }
}

