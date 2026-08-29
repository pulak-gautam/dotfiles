return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  main = 'nvim-treesitter',
  opts = {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ap'] = '@parameter.outer',
          ['ip'] = '@parameter.inner',
        },
      },
    },
  },
}
