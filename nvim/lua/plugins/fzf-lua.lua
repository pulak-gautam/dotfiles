local function grep_open_buffers()
  local files = {}
  for _, buf in ipairs(vim.fn.getbufinfo { buflisted = 1 }) do
    if buf.name ~= '' then table.insert(files, buf.name) end
  end
  if #files == 0 then
    vim.notify('No open files to search', vim.log.levels.WARN)
    return
  end
  require('fzf-lua').live_grep { search_paths = files }
end

local function search_root()
  if vim.bo.filetype == 'oil' then return require('oil').get_current_dir() or vim.fn.getcwd() end
  return vim.fn.getcwd()
end

return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    keymap = {
      builtin = {
        ['C-d'] = 'preview-page-down',
        ['C-u'] = 'preview-page-up',
      },
    },
  },
  keys = {
    { '<leader>sh', function() require('fzf-lua').helptags() end },
    { '<leader>sk', function() require('fzf-lua').keymaps() end },
    { '<leader>sf', function() require('fzf-lua').files { cwd = search_root() } end },
    { '<leader>sg', function() require('fzf-lua').live_grep { cwd = search_root() } end },
    { '<leader>S', function() require('fzf-lua').builtin() end },
    { '<leader>sw', function() require('fzf-lua').grep_cword() end },
    { '<leader>sw', function() require('fzf-lua').grep_visual() end },
    { '<leader>sd', function() require('fzf-lua').diagnostics_workspace() end },
    { '<leader>sr', function() require('fzf-lua').resume() end },
    { '<leader>s.', function() require('fzf-lua').oldfiles() end },
    { '<leader>sc', function() require('fzf-lua').commands() end },
    { '<leader>sb', function() require('fzf-lua').buffers() end },
    { '<leader>sn', function() require('fzf-lua').files { cwd = vim.fn.stdpath 'config' } end },
    { '<leader>sN', function() require('fzf-lua').live_grep { cwd = vim.fn.stdpath 'config' } end },
    { '<leader>/', grep_open_buffers, desc = 'Search open buffers' },
  },
}
