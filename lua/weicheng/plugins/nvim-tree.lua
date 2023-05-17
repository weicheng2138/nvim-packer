local setup, nvim_tree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

nvim_tree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
			quit_on_open = true,
		},
	},
	filters = { dotfiles = false, custom = { "^.git$" } },
	git = {
		enable = true,
		ignore = false,
	},
})
