return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,

    dependencies = {
        { 'JoosepAlviste/nvim-ts-context-commentstring' },
        { 'HiPhish/rainbow-delimiters.nvim' },
        { 'windwp/nvim-ts-autotag' }
        -- {'windwp/nvim-autopairs'}
    },

    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c", "cpp", "lua"
            },
            sync_install = false,
            auto_install = true,

            highlight = { enable = true },
            -- indent = { enable = true },
            autotag = { enable = true }
        })
    end
}
