return {
  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    init = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    keys = {
      { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
      { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
      { 'zi', 'zi', desc = 'Toggle folding globally' },
    },
    opts = {
      provider_selector = function() return { 'lsp', 'indent' } end,
    },
  },

  {
    'ethanholz/nvim-lastplace',
    opts = {
      lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
      lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
      lastplace_open_folds = true,
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      { '<A-H>', function() require('smart-splits').resize_left() end, mode = 'n', desc = 'Resize split left' },
      { '<A-J>', function() require('smart-splits').resize_down() end, mode = 'n', desc = 'Resize split down' },
      { '<A-K>', function() require('smart-splits').resize_up() end, mode = 'n', desc = 'Resize split up' },
      { '<A-L>', function() require('smart-splits').resize_right() end, mode = 'n', desc = 'Resize split right' },
    },
  },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Using Lazy
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      require('onedark').load()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#587c0c' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#0c7d9d' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#f14c4c' })
      vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { fg = '#f14c4c' })
      vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#0c7d9d' })
      vim.api.nvim_set_hl(0, 'GitSignsUntracked', { fg = '#587c0c' })

      require('gitsigns').setup {
        signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '' },
          topdelete = { text = '' },
          changedelete = { text = '▎' },
          untracked = { text = '┆' },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        current_line_blame = false,
        on_attach = function() end,
      }
    end,
  },
}
