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
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

				vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, opts)
				vim.keymap.set("n", "<leader>ch", ":LspClangdSwitchSourceHeader<CR>")
			end,
		})

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "💣",
					[vim.diagnostic.severity.WARN] = "🗿",
				},
			},
		})
	end,
}
