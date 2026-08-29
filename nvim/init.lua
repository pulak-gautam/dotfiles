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
require 'config.clipboard'
require 'config.filetypes'
require 'config.terminal'
require 'config.lsp'

vim.cmd.colorscheme 'aizen_dark'
