local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Base
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")

	-- Colorschemes
	use("dracula/vim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("RRethy/vim-illuminate")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- use("glepnir/lspsaga.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-ui-select.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- GitHub Copilot
	use("github/copilot.vim")

	-- Surround
	use("kylechui/nvim-surround")

	-- Cloak (by laytanl_)
	use("laytan/cloak.nvim")

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Packer
	--[[ use({ ]]
	--[[ 	"folke/noice.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("noice").setup({ ]]
	--[[ 			-- add any options here ]]
	--[[ 			lsp = { ]]
	--[[ 				-- override markdown rendering so that **cmp** and other plugins use **Treesitter** ]]
	--[[ 				override = { ]]
	--[[ 					["vim.lsp.util.convert_input_to_markdown_lines"] = true, ]]
	--[[ 					["vim.lsp.util.stylize_markdown"] = true, ]]
	--[[ 					["cmp.entry.get_documentation"] = true, ]]
	--[[ 				}, ]]
	--[[ 			}, ]]
	--[[ 			-- you can enable a preset for easier configuration ]]
	--[[ 			presets = { ]]
	--[[ 				bottom_search = true, -- use a classic bottom cmdline for search ]]
	--[[ 				command_palette = true, -- position the cmdline and popupmenu together ]]
	--[[ 				long_message_to_split = true, -- long messages will be sent to a split ]]
	--[[ 				inc_rename = false, -- enables an input dialog for inc-rename.nvim ]]
	--[[ 				lsp_doc_border = false, -- add a border to hover docs and signature help ]]
	--[[ 			}, ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ 	requires = { ]]
	--[[ 		"MunifTanjim/nui.nvim", ]]
	--[[ 		"rcarriga/nvim-notify", ]]
	--[[ 	}, ]]
	--[[ }) ]]

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
