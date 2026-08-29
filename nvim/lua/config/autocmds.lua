vim.api.nvim_create_autocmd('FileType', {
  pattern = 'csv',
  callback = function()
    vim.cmd 'CsvViewEnable display_mode=border'
    vim.opt_local.wrap = false
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function() vim.cmd 'setlocal spell spelllang=en_us' end,
})

vim.api.nvim_create_augroup('CreateDirs', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = 'CreateDirs',
  pattern = '*',
  callback = function()
    local file_path = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(file_path) == 0 then vim.fn.mkdir(file_path, 'p') end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Source - https://stackoverflow.com/a/78501693
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt_local.fo:remove("o")
    vim.opt_local.fo:remove("r")
  end,
})

