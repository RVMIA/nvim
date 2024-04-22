return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{
			"williamboman/mason.nvim", -- Optional
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		{ "hrsh7th/nvim-cmp" }, -- Required -- Autocompletion
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "rust_analyzer", "clangd" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- this is the "custom handler" for `lua_ls`
				lua_ls = function()
					local lua_opts = lsp.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})

		-- Fix Undefined global 'vim'
		--lsp.nvim_workspace()

		local cmp = require("cmp")
		local cmp_format = lsp.cmp_format()

		cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
			formatting = cmp_format,
			mapping = cmp.mapping.preset.insert({
				-- scroll up and down the documentation window
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),
		})

		--local cmp_mappings = lsp.defaults.cmp_mappings({
		--	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		--	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		--	["<C-y>"] = cmp.mapping.confirm({ select = true }),
		--	["<C-Space>"] = cmp.mapping.complete(),
		--})

		--cmp_mappings["<Tab>"] = nil
		--cmp_mappings["<S-Tab>"] = nil

		--lsp.set_preferences({
		--	suggest_lsp_servers = false,
		--	sign_icons = {
		--		error = "E",
		--		warn = "W",
		--		hint = "H",
		--		info = "I",
		--	},
		--})

		--lsp.setup()

		--vim.diagnostic.config({
		--	virtual_text = true,
		--})
	end,
}
