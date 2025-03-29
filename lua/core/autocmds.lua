local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local autosave = augroup("autosave", {})

autocmd({"TextChanged","TextChangedI", "FocusLost"}, {
    group = autosave,
    pattern = "*",
    callback = function ()
        if vim.bo.buftype == "" then
            vim.cmd("silent wa")
        end
    end
})
