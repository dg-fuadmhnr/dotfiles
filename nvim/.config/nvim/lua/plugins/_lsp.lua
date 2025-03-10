return {
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "VeryLazy", "BufReadPre", "BufNewFile", "BufRead" },
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				lazy = true,
				cmd = {
					"LspInfo",
					"LspInstall",
					"LspUninstall",
				},
			},
			{
				"williamboman/mason.nvim",
				lazy = true,
				build = ":MasonUpdate",
				opts_extend = { "ensure_installed" },
				cmd = {
					"Mason",
					"MasonInstall",
					"MasonUninstall",
					"MasonUninstallAll",
					"MasonLog",
				},
				opts = function(_, opts)
					local icons = require("user.icons").ui
					opts.ensure_installed = opts.ensure_installed or {}
					vim.list_extend(opts.ensure_installed, { "stylua" })
					opts.ui = {
						-- border = "none",
						border = icons.Border,
						icons = {
							package_pending = icons.Pending,
							package_installed = icons.CheckCircle,
							package_uninstalled = icons.BlankCircle,
						},
						keymaps = {
							toggle_server_expand = "<CR>",
							install_server = "i",
							update_server = "u",
							check_server_version = "c",
							update_all_servers = "U",
							check_outdated_servers = "C",
							uninstall_server = "X",
						},
					}
					opts.log_level = vim.log.levels.INFO
					opts.max_concurrent_installers = 4
					return opts
				end,
				config = function(_, opts)
					require("mason").setup(opts)
					local mr = require("mason-registry")
					mr:on("package:install:success", function()
						vim.defer_fn(function()
							-- trigger FileType event to possibly load this newly installed LSP server
							require("lazy.core.handler.event").trigger({
								event = "FileType",
								buf = vim.api.nvim_get_current_buf(),
							})
						end, 100)
					end)

					mr.refresh(function()
						for _, tool in ipairs(opts.ensure_installed) do
							local p = mr.get_package(tool)
							if not p:is_installed() then
								p:install()
							end
						end
					end)
				end,
			},
		},
		opts = function(_, opts)
			opts.skip_config = opts.skip_config or {}
			opts.ensure_installed = opts.ensure_installed or {}
			opts.automatic_installation = true
			vim.list_extend(opts.ensure_installed, { "lua_ls" })
		end,
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			local option = {}
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local capabilities = require("user.lsp.handlers").capabilities
					if server_name == "clangd" then
						capabilities.offsetEncoding = { "utf-16" }
					end
					if idxOf(opts.skip_config, server_name) == nil then
						option = {
							on_attach = require("user.lsp.handlers").on_attach,
							capabilities = capabilities,
						}
						server_name = vim.split(server_name, "@")[1]
						local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server_name)
						if require_ok then
							option = vim.tbl_deep_extend("force", conf_opts, option)
						end
						require("lspconfig")[server_name].setup(option)
					end
				end,
			})
			require("user.lsp.handlers").setup()
		end,
    -- stylua: ignore
    keys={
      { "<leader>l", "", desc = "  LSP", mode = "n" },
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "n" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", mode = "n" },
			{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", mode = "n" },
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = "n" },
			{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason", mode = "n" },
			{ "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", mode = "n" },
			{ "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", mode = "n" },
			{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Code Lens Action", mode = "n" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", mode = "n" },
			{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", mode = "n" },
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = "n" },
			{ "<leader>lS",	"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",	desc = "Workspace Symbols",	mode = "n"},
    }
,
	},
}
