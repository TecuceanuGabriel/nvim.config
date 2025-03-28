return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        -- Package manager
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        -- Autocompletion
        { "ms-jpq/coq_nvim",                  branch = "coq" },
        { "ms-jpq/coq.artifacts",             branch = "artifacts" },
    },

    init = function()
        vim.q.coq_settings = {
            auto_start = true
        }
    end,

    config = function()
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls', 'clangd'
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })
    end
}
