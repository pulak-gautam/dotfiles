local set = vim.keymap.set

local function qf_open() return vim.fn.getqflist({ winid = 0 }).winid ~= 0 end

local function qf_next()
  local ok, err = pcall(vim.cmd, 'cnext')
  if not ok and err:match 'E553' then vim.cmd 'cfirst' end
end

local function qf_prev()
  local ok, err = pcall(vim.cmd, 'cprev')
  if not ok and err:match 'E553' then vim.cmd 'clast' end
end

local function qf_delete()
  if not qf_open() then return end

  local qflist = vim.fn.getqflist()

  if #qflist == 0 then
    vim.notify 'Quickfix list empty'
    vim.cmd 'cclose'
    return
  end

  local cur = vim.fn.qflist({ idx = 0 }).idx
  if cur == 0 then return end
  table.remove(qflist, cur)
  vim.fn.setqflist(qflist, 'r')

  if #qflist == 0 then return end

  cur = cur <= #qflist and cur or 1
  vim.cmd(cur .. 'cc')
end

-- move around splits
set('n', '<c-j>', '<c-w><c-j>')
set('n', '<c-k>', '<c-w><c-k>')
set('n', '<c-l>', '<c-w><c-l>')
set('n', '<c-h>', '<c-w><c-h>')

-- move around tabs
-- vim.keymap.set('n', 'L', ':tabnext<CR>', { desc = 'Next Tab' })
-- vim.keymap.set('n', 'H', ':tabprevious<CR>', { desc = 'Previous Tab' })

-- buffers
set('n', 'L', ':bnext<CR>', { desc = 'Next Buffer', silent = true })
set('n', 'H', ':bprevious<CR>', { desc = 'Previous Buffer', silent = true })

set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })

set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- toggle spellcheck
set('n', '<leader>ll', ':setlocal spell! spelllang=en<CR>')

-- jump to diagnostics
set('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end)
set('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end)

-- navigate qflist
set('n', ']q', qf_next, { silent = true })
set('n', '[q', qf_prev, { silent = true })
set('n', '<C-x>', qf_delete)
set('n', '<C-q>', '<cmd>cclose<CR>')

-- move current line, and navigate in vimdiff
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

-- escape diffmode
vim.keymap.set('n', '<Esc>', function()
  if vim.wo.diff then
    vim.cmd 'diffoff!'

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local buf = vim.api.nvim_win_get_buf(win)
      local name = vim.api.nvim_buf_get_name(buf)
      if name:match 'gitsigns://' then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  else
    vim.cmd 'noh'
  end
end)
