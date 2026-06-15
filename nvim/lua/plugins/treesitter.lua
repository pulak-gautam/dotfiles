return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local filetypes = {
        'awk',
        'bash',
        'c',
        'cmake',
        'cpp',
        'diff',
        'dockerfile',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'julia',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'nix',
        'query',
        'r',
        'rnoweb',
        'rust',
        'vim',
        'vimdoc',
        'haskell',
      }
      require('nvim-treesitter').install(filetypes)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
}
