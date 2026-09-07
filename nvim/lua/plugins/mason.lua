return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        PATH = 'prepend',
      }
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        automatic_enable = false,
        ensure_installed = {
          'lua_ls',
          'gopls',
          'marksman',
          'rust_analyzer',
          'systemd_lsp',
          'dockerls',
          'awk_ls',
          'bashls',
          'clangd',
          'neocmake',
          'r_language_server',
          'julials',
          'hls',
          'ts_ls',
          'zls',
        },
      }
    end,
  },
}
