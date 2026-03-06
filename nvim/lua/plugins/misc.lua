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

  { 'ethanholz/nvim-lastplace' },

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

  {
    -- `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
        },
      }
      vim.cmd.colorscheme 'wildcharm'
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
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
    },
  },
}
