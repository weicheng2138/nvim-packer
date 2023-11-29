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
vim.api.nvim_create_autocmd({ "bufenter", "bufwritepost", "insertleave" }, {
	group = lint_augroup,
	callback = function()
		-- check if eslint config exists
		local eslint = vim.fs.find(
			{ ".eslintrc.js", ".eslintrc.json", ".eslintrc", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml" },
			{
				upward = true,
				path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
			}
		)
		if eslint[1] ~= nil then
			-- do the linting
			lint.try_lint()
		end
	end,
})

-- mannually trigger linting
vim.keymap.set("n", "<leader>l", function()
	-- check if eslint config exists
	local eslint = vim.fs.find(
		{ ".eslintrc.js", ".eslintrc.json", ".eslintrc", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml" },
		{
			upward = true,
			path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
		}
	)
	if eslint[1] ~= nil then
		-- do the linting
		lint.try_lint()
	end
end, { desc = "trigger linting for current file" })
