vim.api.nvim_create_user_command('Gs', function(opts)
  local arg = opts.args ~= '' and opts.args or nil
  local gitsigns = require 'gitsigns'

  if arg and type(gitsigns[arg]) == 'function' then
    gitsigns[arg]()
  else
    gitsigns.diffthis(arg)
  end
end, { nargs = '?', desc = 'Gitsigns shortcut' })

-- Allow typing lowercase :gs in the colon command bar
vim.cmd [[cnoreabbrev <expr> gs (getcmdtype() == ':' && getcmdline() ==# 'gs') ? 'Gs' : 'gs']]
