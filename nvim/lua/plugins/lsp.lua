return {
  -- progress ui for lsp indexing
  { 'j-hui/fidget.nvim', opts = {} },
  { "folke/lazydev.nvim", opts = {} },
  { "Bilal2453/luvit-meta", lazy = true },

  -- diagnostics lines
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

      vim.keymap.set(
        "", 
        "<leader>l", 
        function()
          local config = vim.diagnostic.config() or {}
          if config.virtual_text then
            vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
          else
            vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
          end
        end, 
        { desc = "Toggle lsp_lines" })
    end,
  },

  -- autoformat
  {
    'stevearc/conform.nvim',
    event = { 'bufwritepre' },
    cmd = { 'Conforminfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format { async = true, lsp_format = 'fallback' } end,
        mode = '',
        desc = '[f]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = {}
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
}
