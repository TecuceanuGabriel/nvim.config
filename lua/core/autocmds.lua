local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local autosave = augroup("autosave", {})

autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
	group = autosave,
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
			vim.cmd("silent w")
		end
	end,
})
