local opt = vim.opt --for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- code folding
-- opt.foldmethod = "manual"

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedlus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- making "-" to be considered as part of the word
