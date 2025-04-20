return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = "[LSP] Show Diagnostics", noremap = true, silent = true })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "[LSP] Go to Previous Diagnostic", noremap = true, silent = true })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "[LSP] Go to Next Diagnostic", noremap = true, silent = true })

      local on_attach = function(client, bufnr)
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
        }, bufnr)

        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "[LSP] Show Hover Info", buffer = bufnr })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "[LSP] Go to Definition", buffer = bufnr })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "[LSP] Go to Implementation", buffer = bufnr })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "[LSP] Find References", buffer = bufnr })
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { desc = "[LSP] Show Signature Help", buffer = bufnr })
      end

      local server_map = {
        ts_ls = "ts_ls",
        bashls = "bashls",
        clangd = "clangd",
        phpactor = "phpactor",
        rust_analyzer = "rust_analyzer",
      }

      require("mason-lspconfig").setup_handlers {
        function(server_name)
          local lsp_server = server_map[server_name] or server_name

          local capabilities = require('cmp_nvim_lsp').default_capabilities()

          require("lspconfig")[lsp_server].setup {
            capabilities = capabilities,
            on_attach = on_attach
          }
        end,
      }

      local cmp = require'cmp'

      cmp.setup({
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-s>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_document_symbol' },
          { name = 'nvim_lsp_signature_help' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end,
  },
}

