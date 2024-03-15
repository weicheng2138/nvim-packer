local setup, ts = pcall(require, "typescript-tools")
if not setup then
	return
end

ts.setup({
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",

		"vue", -- This needed to be added.
	},
	settings = {
		tsserver_plugins = {
			-- Seemingly this is enough, no name, location or languages needed.
			"@vue/typescript-plugin",
		},
	},
})
