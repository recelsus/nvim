return {
  {
    "voldikss/vim-translator",
    config = function()
      vim.g.translator_default_engines = {'google'}

      vim.g.translator_target_lang = 'ja'
      vim.g.translator_source_lang = 'auto'
    end
  }
}
