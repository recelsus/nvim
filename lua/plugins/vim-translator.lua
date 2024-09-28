return {
  {
    "voldikss/vim-translator",
    event = "BufReadPre",
    config = function()
      vim.g.translator_default_engines = {'google'}
      vim.g.translator_target_lang = 'ja'
      vim.g.translator_source_lang = 'auto'
      
      vim.keymap.set('n', '<leader>tt', '<Plug>Translate', { noremap = true, silent = true, desc = "[Translator] Translate Word" })
      vim.keymap.set('v', '<leader>tt', '<Plug>TranslateV', { noremap = true, silent = true, desc = "[Translator] Translate Selected Text" })
      vim.keymap.set('x', '<leader>tt', '<Plug>TranslateV', { noremap = true, silent = true, desc = "[Translator] Translate Selected Text" })
      vim.keymap.set('n', '<leader>tw', '<Plug>TranslateW', { noremap = true, silent = true, desc = "[Translator] Translate Word in Window" })
      vim.keymap.set('n', '<leader>tr', '<Plug>TranslateR', { noremap = true, silent = true, desc = "[Translator] Replace Word with Translation" })
      vim.keymap.set('v', '<leader>tr', '<Plug>TranslateRV', { noremap = true, silent = true, desc = "[Translator] Replace Selected Text with Translation" })
    end
  }
}
