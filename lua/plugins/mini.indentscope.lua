return {
  {
    "echasnovski/mini.indentscope",
    version = false,  -- 安定版の代わりに最新バージョンを使用
    config = function()
      require('mini.indentscope').setup({
        -- インデントガイドのシンボル
        symbol = '│', -- デフォルトのシンボル
        options = {
          try_as_border = true,  -- インデントを範囲境界として扱う
        },
        draw = {
          delay = 100,  -- インデント表示の遅延（ミリ秒）
          animation = require('mini.indentscope').gen_animation.none() -- アニメーションなし
        }
      })

      -- ハイライト設定（お好みで調整可能）
      vim.cmd([[ highlight MiniIndentscopeSymbol guifg=#E5C07B ]])  -- インデントシンボルの色を設定
    end
  }
}

