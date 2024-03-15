vim.g.mapleader = " "

local keymap = vim.keymap

-- Visual mode, press "<leader>y", yank to clipboard
keymap.set("v", "<leader>y", '"*y')

-- Normal mode, press "<esc>", close highlight after search
keymap.set("n", "<esc>", ":noh <CR>")

-- Normal mode, press "<leader><CR>", source your config0
-- and make the config activated
keymap.set("n", "<leader><CR>", ":so %<CR>")

-- Normal mode, press " nh", cancel the highlighted words
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Normal mode, press "x", delete and won't be in register
keymap.set("n", "x", '"_x')

-- Normal mode, press " +" || " -", to increment the number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows to be equally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split

-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close new tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

-- szw/vim-maximizer to maximize and restore the window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree/nvim-tree.lua for file explore
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=false<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- git
keymap.set("n", "<leader>gd", "<cmd>GitDiff<cr>")
-- keymap.set("n", "<leader>gdc", "<cmd>GitDiffClose<cr>")

-- trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
