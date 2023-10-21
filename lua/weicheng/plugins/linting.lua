local setup, lint = pcall(require, "lint")
if not setup then
	return
end

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	vue = { "eslint_d" },
	python = { "ruff" },
}

-- create augroup for linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- the moment you lint it, such as saving, inserting and entering a buffer.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		-- do the linting
		lint.try_lint()
	end,
})

-- mannually trigger linting
vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
