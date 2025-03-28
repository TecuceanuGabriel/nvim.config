return {
   'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        { 'L3MON4D3/LuaSnip', run = "make install_jsregexp" },
        'rafamadriz/friendly-snippets',
    },

    opts = {
        keymap = { preset = 'super-tab' },
        appearance = {
            nerd_font_variant = 'normal'
        },
        completion = { documentation = { auto_show = false } },
    },
    opts_extend = { "sources.default" }
}
