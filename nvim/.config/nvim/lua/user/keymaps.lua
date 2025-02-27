local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- MODES
-- normal mode = "n"
-- insert mode = "i"
-- visual mode = "v"
-- visual block mode = "x"
-- term mode = "t"
-- command mode = "c"
-- alt key = "m"

-- universal mode
for _, mode in ipairs({ "i", "v", "n", "x" }) do
	-- duplicate line
	keymap(mode, "<S-Down>", "<CMD>t.<CR>", options)
	keymap(mode, "<S-Up>", "<CMD>t -1<CR>", options)

	-- save file
	keymap(mode, "<C-s>", "<cmd>silent! w<cr>", options)
end

-- duplicate line visual block
keymap("x", "<S-Down>", ":'<,'>t'><cr>", options)
keymap("x", "<S-Up>", ":'<,'>t-1<cr>", options)
-- move text up and down
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", options)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", options)
keymap("n", "<M-Down>", "<cmd>m+<cr>", options)
keymap("i", "<M-Down>", "<cmd>m+<cr>", options)
keymap("n", "<M-Up>", "<cmd>m-2<cr>", options)
keymap("i", "<M-Up>", "<cmd>m-2<cr>", options)
-- create comment CTRL + / all mode
keymap("v", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", options)
keymap("v", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", options)
keymap("i", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", options)
keymap("i", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", options)
keymap("i", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>", options)
keymap("i", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>", options)
keymap("n", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>", options)
keymap("n", "<C-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise.current()<cr>", options)

-- close windows
keymap("n", "<leader>q", "<CMD>q<CR>", options)

-- Copy ke clipboard sistem
keymap("v", "<leader>y", '"+y', options) -- Copy saat mode visual
keymap("n", "<leader>Y", '"+Y', options) -- Copy satu baris penuh saat mode normal

-- Paste dari clipboard sistem
keymap("n", "<leader>p", '"+p', options) -- Paste setelah kursor
keymap("n", "<leader>P", '"+P', options) -- Paste sebelum kursor
keymap("v", "<leader>p", '"+p', options) -- Paste di area yang dipilih
