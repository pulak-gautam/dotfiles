vim.lsp.enable {
  'lua_ls',
  'gopls',
  'marksman',
  'nixd',
  'rust_analyzer',
  'systemd_lsp',
  'dockerls',
  'awk_ls',
  'bashls',
  'clangd',
  'neocmake',
  'r_language_server',
  'julials',
  'hls',
}

local fzflua = require 'fzf-lua'
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('fzf-lua-lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set('n', 'gr', fzflua.lsp_references, { buffer = 0 })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0 })
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })

    vim.keymap.set('n', '<space>cr', vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { buffer = 0 })
    vim.keymap.set('n', '<space>ds', fzflua.lsp_document_symbols, { buffer = 0 })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      vim.keymap.set('n', '<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end)
    end
  end,
})
