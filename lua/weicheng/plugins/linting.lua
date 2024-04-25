local setup, lint = pcall(require, "lint")
if not setup then
	return
end

local frontend_linter_name = "eslint_d"
-- local frontend_linter_name = "oxlint"
lint.linters_by_ft = {
	javascript = { frontend_linter_name },
	typescript = { frontend_linter_name },
	javascriptreact = { frontend_linter_name },
	typescriptreact = { frontend_linter_name },
	svelte = { frontend_linter_name },
	vue = { frontend_linter_name },
	python = { "ruff" },
}
-- lint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }
--
-- lint.linters = {
-- 	eslint_d = {
-- 		args = {
-- 			"--no-warn-ignored", -- <-- this is the key argument
-- 			"--format",
-- 			"json",
-- 			"--stdin",
-- 			"--stdin-filename",
-- 			function()
-- 				return vim.api.nvim_buf_get_name(0)
-- 			end,
-- 		},
-- 	},
-- }

-- create augroup for linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
local eslint = {}

-- check if eslint config exists when entering vim after setup
vim.api.nvim_create_autocmd({ "vimenter" }, {
	group = lint_augroup,
	callback = function()
		eslint = vim.fs.find(
			{ ".eslintrc.js", ".eslintrc.json", ".eslintrc", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml" },
			{
				upward = true,
				path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
			}
		)
	end,
})

-- the moment you lint it, such as saving and inserting.
vim.api.nvim_create_autocmd({ "bufwritepost", "insertleave" }, {
	group = lint_augroup,
	callback = function()
		-- check if eslint config exists
		if eslint[1] ~= nil then
			-- do the linting
			lint.try_lint()
		end
	end,
})

-- mannually trigger linting
vim.keymap.set("n", "<leader>l", function()
	if eslint[1] ~= nil then
		lint.try_lint()
	end
end, { desc = "trigger linting for current file" })
