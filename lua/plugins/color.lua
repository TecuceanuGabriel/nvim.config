function Color(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
end

return {
    'morhetz/gruvbox',
    'joshdick/onedark.vim',
    'olimorris/onedarkpro.nvim',
    'dracula/vim',
    'folke/tokyonight.nvim',
    'rose-pine/neovim',
    'lifepillar/vim-solarized8',

    'chriskempson/base16-vim',
    'rafi/awesome-vim-colorschemes',
}
