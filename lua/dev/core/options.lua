local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop     = 2
opt.shiftwidth  = 2
opt.softtabstop = 2
opt.autoindent  = true
opt.expandtab   = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase  = true
opt.smartcase   = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background  = "dark"
opt.signcolumn  = "yes"

-- backspace
opt.backspace   = "indent,eol,start"

-- clipboard (copy paste from clipboard)
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
