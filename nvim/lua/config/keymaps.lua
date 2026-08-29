local set = vim.keymap.set

-- move around splits
set('n', '<c-j>', '<c-w><c-j>')
set('n', '<c-k>', '<c-w><c-k>')
set('n', '<c-l>', '<c-w><c-l>')
set('n', '<c-h>', '<c-w><c-h>')

-- move around tabs
vim.keymap.set('n', 'L', ':tabnext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', 'H', ':tabprevious<CR>', { desc = 'Previous Tab' })

set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })

set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- toggle spellcheck
set('n', '<leader>ll', ':setlocal spell! spelllang=en<CR>')

-- jump to diagnostics
set('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end)
set('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end)

-- move selections, and navigate in vimdiff
set('n', '<M-j>', function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set('n', '<M-k>', function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)

-- toggle hints
-- set("n", "<space>tt", function()
--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
-- end)

-- j/k -> [g]j/k, handling group lines
set('n', 'j', function(...)
  local count = vim.v.count

  if count == 0 then
    return 'gj'
  else
    return 'j'
  end
end, { expr = true })

set('n', 'k', function(...)
  local count = vim.v.count

  if count == 0 then
    return 'gk'
  else
    return 'k'
  end
end, { expr = true })

set('v', '<', '<gv', { noremap = true, silent = true })
set('v', '>', '>gv', { noremap = true, silent = true })
