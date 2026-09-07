return {
  {
    'ggandor/leap.nvim',
    config = function()
      local leap = require 'leap'

      -- Modern leap.nvim uses .opts instead of .setup()
      leap.opts.safe_labels = {}
      leap.opts.max_phase_one_targets = 0
      leap.opts.max_highlighted_traversal_targets = 10
      leap.opts.labels = 'jklasdfghqwertyuiopzxcvbnm/JKLASDFGHQWERTYUIOPZXCVBNM?'
      leap.opts.equivalence_classes = { ' \t\r\n', '([{', '}])', "''" }

      -- Bidirectional search
      vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')

      -- Remote operations at a distance
      vim.keymap.set({ 'n', 'o' }, 'r', function() require('leap.remote').action() end)

      vim.api.nvim_set_hl(0, 'LeapLabel', { fg = '#000000', bg = '#CCFF88', bold = true })
    end,
  },
}
