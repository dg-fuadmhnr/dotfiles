return {
	"pojokcodeid/auto-lualine.nvim",
	event = { "InsertEnter", "BufRead", "BufNewFile" },
	dependencies = { "nvim-lualine/lualine.nvim" },
	config = function()
		local lualine = require("auto-lualine")

		local color = "auto"
		local options = "roundedall"
		local show_mode = 0

		lualine.setup({
			setColor = color,
			setOption = options,
			setMode = show_mode,
		})
	end,
}
