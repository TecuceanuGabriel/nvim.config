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
	"joshdick/onedark.vim",
	"lifepillar/vim-solarized8",
	"Mofiqul/vscode.nvim",
	"projekt0n/github-nvim-theme",
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
}
