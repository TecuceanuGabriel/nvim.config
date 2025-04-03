return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_Ft = {
            c = { "clangtidy" },
            json = { "jsonlint" },
        }

        vim.api.nvim_create_autocmd({
            "BufWritePost",
            "BufReadPost",
            "InsertLeave"
        }, {
            callback = function()
                lint.try_lint()
            end
        })
    end
}
