-- If packer is not installed, it will install it for us.
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Update new one and remove something you are not using
-- Whenever you save the file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- colorscheme in core/colorscheme.lua
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })

	-- tmux & split window navigation
	-- use <C-hjkl> to move around the split windows
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer") -- maximizes and restore the window

	-- interesting essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- comment out plugins
	use("numToStr/Comment.nvim")
	-- comment with ts context for jsx commenting
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- file explore
	use({
		"nvim-tree/nvim-tree.lua",
	})

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder
	-- use({
	-- 	"nvim-telescope/telescope-fzf-native.nvim",
	-- 	run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	-- })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("pmizio/typescript-tools.nvim")

	-- (null-ls is not maintaining any more) formatting & linting
	-- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	-- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- formatter
	use({
		"stevearc/conform.nvim",
		-- event = { "BufReadPre", "BufNewFile" },
	})

	-- linter
	use("mfussenegger/nvim-lint")

	-- ts error formatter
	use("davidosomething/format-ts-errors.nvim")
	-- use({ "OlegGulevskyy/better-ts-errors.nvim", requires = "MunifTanjim/nui.nvim" })
	-- use({
	-- 	"Fildo7525/pretty_hover",
	-- 	config = function()
	-- 		require("pretty_hover").setup({})
	-- 	end,
	-- })

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- todo comment
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- trouble nvim
	use("folke/trouble.nvim")

	-- git
	use("dinhhuy258/git.nvim")

	-- tailwindcss color class
	use("themaxmarchuk/tailwindcss-colors.nvim")

	-- colorizer
	use("norcalli/nvim-colorizer.lua")

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- github copilot
	use("github/copilot.vim")

	-- indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
