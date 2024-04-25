-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
-- local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
-- if not mason_null_ls_status then
-- 	return
-- end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		-- "tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		-- "volar",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_lspconfig.setup_handlers({
	function(server_name)
		local server_config = {}
		if server_name == "tsserver" then
			server_config.init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/Users/weicheng/.local/share/nvim/mason/bin/vue-language-server",
						languages = { "vue" },
					},
				},
			}
		end
		if server_name == "volar" then
			-- server_config.filetypes = { "vue", "typescript", "javascript" }
			server_config.init_options = {
				vue = {
					hybridMode = false,
				},
				-- typescript = {
				-- 	tsdk = "/Users/weicheng/Library/pnpm/global/5/node_modules/typescript/lib",
				-- },
			}
		end
		lspconfig[server_name].setup(server_config)
	end,
})

-- mason_null_ls.setup({
-- 	-- list of formatters & linters for mason to install
-- 	ensure_installed = {
-- 		"prettier", -- ts/js formatter
-- 		"stylua", -- lua formatter
-- 		"eslint_d", -- ts/js linter
--
-- 		-- list of python servers to install
-- 		"pyright",
-- 		-- "mypy",
-- 		"ruff",
-- 		"black",
-- 	},
-- 	-- auto-install configured formatters & linters (with null-ls)
-- 	automatic_installation = true,
-- })
