return {

	{
		"rebelot/kanagawa.nvim",
		lazy = true,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
	},
	{
		"jacoborus/tender.vim",
		lazy = false,
        config = function()
            vim.cmd([[colorscheme tender]])
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = true,
		config = function()
			vim.cmd([[colorscheme oxocarbon]])
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{ "vim-airline/vim-airline", lazy = true },
}
