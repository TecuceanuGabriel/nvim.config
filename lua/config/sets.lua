vim.opt.encoding = "UTF-8"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 5

vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.errorbells = false
vim.opt.guicursor = ""
vim.opt.mouse = "a"

vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.hidden = true
