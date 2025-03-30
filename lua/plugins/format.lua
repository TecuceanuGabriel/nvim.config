return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            lua = { "stylua" },
        })
    end
}
