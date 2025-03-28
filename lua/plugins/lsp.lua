return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        -- Package manager
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'saghen/blink.cmp',
    },

    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- mason
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls', 'clangd'
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({capabilities = capabilities})
                end,
            }
        })
    end
}
