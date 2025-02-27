local options = {
	backspace = vim.opt.backspace + {"nostop"}, -- don't stop backspace when insert
	clipboard = "unnamedplus", -- using system clipboard
	cmdheight = 0,
	completeopt = {"menuone", "noselect"}, -- completing insert mode,
	copyindent = true, -- copy indent from line
	cursorline = true, -- show cursor line
	expandtab = true, -- using space on tab
	fileencoding = "utf-8", -- default encoding
	fillchars = { eob = " " }, -- deactive tilde when unused lines
	history = 100, -- total line that remebered in history
	ignorecase = true, -- searching incasesensitive
	laststatus = 3, --globalstatus
	guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
	lazyredraw = false,
	mouse = "a", -- Mouse support
	number = true, -- show number
	preserveindent = true, -- make indentation persistent
	pumheight = 10, -- pop up height
	relativenumber = true, -- Show number as relative
        scrolloff = 8, -- Total row that show in above and below cursor
	shiftwidth = 2, -- Total space that use in indentation
	showmode = false,
	showtabline = 2, -- Always show tabline
	sidescrolloff = 8, -- total column in cursor side
	signcolumn = "yes", -- Always show sign column
	smartcase = true, -- Search lower and upper case
	splitbelow = true, -- Split window to below
	splitright = true, -- Split window to right
	swapfile = false, -- Disable swap file
	tabstop = 2, -- Total space on tab
	termguicolors = true, -- Activating RGB color 24-bit di TUI
	timeoutlen = 300, -- How long time wait
	undofile = true, -- Persistence undo
	updatetime = 300, -- How long time to trigger plugins
	wrap = false, -- Deactive wrap line
	writebackup = false, -- Disable backup files
	guifont = "Maple Mono NF CN:h15", -- Font that use on GUI neovim
	whichwrap = "bs<>[]hl", -- Lock horizontal
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
