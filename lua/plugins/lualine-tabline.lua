return {
  -- lualine の設定
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,  -- アイコンの有効化
          theme = 'rose-pine',     -- テーマを指定（好みのものに変更可能）
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},  -- ステータスラインを無効にするファイルタイプ
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 'mode' },              -- 現在のモード表示
          lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Gitブランチ、差分、診断メッセージ
          lualine_c = { 'filename' },          -- ファイル名表示
          lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- 文字エンコーディング、ファイル形式、ファイルタイプ
          lualine_y = { 'progress' },          -- ファイル進行状況
          lualine_z = { 'location' }           -- 現在の行番号と列番号
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},  -- Lualine 自体のタブライン設定はここでは使用しない
        extensions = {}
      })
    end
  },
  
  -- tabline の設定
  {
    "kdheepak/tabline.nvim",
    dependencies = { { "nvim-lualine/lualine.nvim", opt = true }, { 'nvim-tree/nvim-web-devicons', opt = true } },
    config = function()
      require('tabline').setup({
        -- Tabline の基本設定
        enable = true,                -- Tabline を有効にする
        options = {
          section_separators = { '', '' },  -- セクションセパレーター
          component_separators = { '', '' },  -- コンポーネントセパレーター
          show_filename_only = true,   -- ファイル名のみを表示
          modified_icon = '●',         -- 修正されたファイルのアイコン
          show_tabs_only = false,      -- タブだけを表示するかどうか
        }
      })

      -- キーマッピング
      local opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<leader>1', '1gt', opts)  -- 1番目のタブに移動
      vim.api.nvim_set_keymap('n', '<leader>2', '2gt', opts)  -- 2番目のタブに移動
      vim.api.nvim_set_keymap('n', '<leader>3', '3gt', opts)  -- 3番目のタブに移動
      vim.api.nvim_set_keymap('n', '<leader>4', '4gt', opts)  -- 4番目のタブに移動
      vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', opts)  -- 新しいタブを開く
      vim.api.nvim_set_keymap('n', '<leader>q', ':tabclose<CR>', opts)  -- 現在のタブを閉じる
    end
  }
}

