return {
	"akinsho/bufferline.nvim",
	branch = "main",
	event = { "BufRead", "InsertEnter", "BufNewFile" },
	dependencies = "pojokcodeid/auto-bufferline.nvim",
	config = function()
		vim.opt.termguicolors = true
		local config = require("auto-bufferline").config()
		require("bufferline").setup(config)
	end,
	keys = {
		{ "<leader>b", "", desc = "  Buffers", mode = "n" },
		{
			"<leader>bb",
			function()
				require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({ previewer = false }))
			end,
			desc = "All Buffer",
			mode = "n",
		},
		{
			"<leader>bc",
			function()
				require("auto-bufferline.configs.utils").bufremove()
			end,
			desc = "Close current buffer",
			mode = "n",
		},
		{ "<leader>bd", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Buffer Left", mode = "n" },
		{ "<leader>bD", "<cmd>BufferLineCloseRight<cr>", desc = "Close Buffer Right", mode = "n" },
		{ "<leader>ba", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Buffer Other", mode = "n" },
		{ "<leader>bA", "<cmd>BufferLineCloseOthers<cr><cmd>bd!<cr>", desc = "Close Buffer All", mode = "n" },
		-- Add keybindings for leader b0, b1, b2, etc.
		{
			"<leader>b0",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 0 then
					vim.cmd("buffer " .. buflist[1]) -- Select the first buffer (index 1)
				end
			end,
			desc = "Select Buffer 1",
			mode = "n",
		},
		{
			"<leader>b1",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 1 then
					vim.cmd("buffer " .. buflist[2]) -- Select the second buffer (index 2)
				end
			end,
			desc = "Select Buffer 2",
			mode = "n",
		},
		{
			"<leader>b2",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 2 then
					vim.cmd("buffer " .. buflist[3]) -- Select the third buffer (index 3)
				end
			end,
			desc = "Select Buffer 3",
			mode = "n",
		},
		{
			"<leader>b3",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 3 then
					vim.cmd("buffer " .. buflist[4])
				end
			end,
			desc = "Select Buffer 4",
			mode = "n",
		},
		{
			"<leader>b4",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 4 then
					vim.cmd("buffer " .. buflist[5])
				end
			end,
			desc = "Select Buffer 5",
			mode = "n",
		},
		{
			"<leader>b5",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 5 then
					vim.cmd("buffer " .. buflist[6])
				end
			end,
			desc = "Select Buffer 6",
			mode = "n",
		},
		{
			"<leader>b6",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 6 then
					vim.cmd("buffer " .. buflist[7])
				end
			end,
			desc = "Select Buffer 7",
			mode = "n",
		},
		{
			"<leader>b7",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 7 then
					vim.cmd("buffer " .. buflist[8])
				end
			end,
			desc = "Select Buffer 8",
			mode = "n",
		},
		{
			"<leader>b8",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 8 then
					vim.cmd("buffer " .. buflist[9])
				end
			end,
			desc = "Select Buffer 9",
			mode = "n",
		},
		{
			"<leader>b9",
			function()
				local buflist = vim.api.nvim_list_bufs()
				if #buflist > 9 then
					vim.cmd("buffer " .. buflist[10])
				end
			end,
			desc = "Select Buffer 10",
			mode = "n",
		},
	},
}
