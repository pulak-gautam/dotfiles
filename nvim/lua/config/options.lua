local opt = vim.opt

opt.mouse = 'a'

opt.showmode = true

opt.cursorline = true
opt.scrolloff = 10

-- live preview :subsitution
opt.inccommand = 'split'

opt.smartcase = true
opt.ignorecase = true

opt.number = true
opt.relativenumber = false

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = 'yes'

opt.swapfile = false

opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

-- disable "-- More --" in listings
opt.more = false

opt.foldmethod = 'manual'

opt.title = true
-- opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true

opt.updatetime = 2000

-- show word diffs in vimdiff
vim.opt.diffopt:append 'linematch:60'
