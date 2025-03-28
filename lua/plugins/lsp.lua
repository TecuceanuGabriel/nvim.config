return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        -- Package manager
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        -- icons
        'onsails/lspkind.nvim',
        -- Snippets
        'saadparwaiz1/cmp_luasnip',
        { 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
        'rafamadriz/friendly-snippets'
    },

    config = function()
        -- mason
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


        -- cmp
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')
        cmp.setup({
            mapping = {
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    maxwidth = {
                        menu = 50,
                        abbr = 50,
                    },
                    ellipsis_char = '...',
                    show_labelDetails = true,
                })
            },
            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                {name = "buffer"},
                {name = "path"},
                {name = "luasnip"},
            })
        })
    end
}
