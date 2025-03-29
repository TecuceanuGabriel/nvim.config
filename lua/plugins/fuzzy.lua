return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>cs', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>cd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
    end
}
