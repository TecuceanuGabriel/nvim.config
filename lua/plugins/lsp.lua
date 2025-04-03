return {
    'neovim/nvim-lspconfig',
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
                "lua_ls", "clangd", "hls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            }
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua", "ormolu"
            }
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                vim.keymap.set("n", "<Leader>cf", vim.lsp.buf.format, opts)
            end
        })

        vim.diagnostic.config({
            virtual_text = true,
        })
    end
}
