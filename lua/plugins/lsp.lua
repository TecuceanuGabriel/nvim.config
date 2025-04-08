return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		-- Package manager
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- Autocompletion
		"saghen/blink.cmp",
	},

	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- mason
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
				"hls",
				"rust_analyzer",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"ormolu",
				"prettier",
				"mdformat",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }
				vim.keymap.set("n", "<Leader>cf", vim.lsp.buf.format, opts)
				vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float, opts)
			end,
		})

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			-- signs = {
			--     text = {
			--         [vim.diagnostic.severity.ERROR] = '💣',
			--         [vim.diagnostic.severity.WARN] = '🗿',
			--     }
			-- }
		})
	end,
}
