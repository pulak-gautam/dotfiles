vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ import = 'plugins' }, {
  change_detection = {
    notify = false,
  },
})

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.usercmds'
require 'config.clipboard'
require 'config.filetypes'
require 'config.terminal'
require 'config.lsp'

-- vim.cmd.colorscheme 'aizen_dark'

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true })
if vim.g.neovide then
  -- vim.g.neovide_cursor_animation_length = 0
  -- vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_scale_factor = 0.70

  vim.api.nvim_set_keymap('v', '<C-v>', '"+P', { noremap = true })
  vim.api.nvim_set_keymap('c', '<C-v>', '<C-R>+', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-v>', '<C-R>+', { noremap = true })
  vim.api.nvim_set_keymap('t', '<C-v>', '<C-\\><C-n>"+Pi', { noremap = true })
end
