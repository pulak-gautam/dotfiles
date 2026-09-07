return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      CustomOilBar = function()
        local path = vim.fn.expand '%'
        path = path:gsub('oil://', '')
        return '  ' .. vim.fn.fnamemodify(path, ':.')
      end

      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
          ['Esc'] = 'actions.close',
        },
        win_options = {
          winbar = '%{v:lua.CustomOilBar()}',
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            local folder_skip = {}
            return vim.tbl_contains(folder_skip, name)
          end,
        },
        -- Optional: Customize the floating window to look more like Telescope
        float = {
          padding = 2,
          max_width = 120,
          max_height = 40,
          border = 'rounded',
          win_options = {
            winblend = 0,
          },
        },
      }

      -- Change this keymap to use toggle_float
      vim.keymap.set('n', '-', require('oil').toggle_float, { desc = 'Open parent directory in floating window' })
    end,
  },
}
