local lsp_services = {
	-- LSP 服务器
	"lua_ls",
	"vtsls",
	"css-lsp",
	"cssmodules_ls",

	-- 格式化器
	"prettier_d",
	"eslint_d",
	"stylua",
}
return {
	-- mason.nvim - 必须在使用 mason-lspconfig 之前设置
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- 设置 LSP 的默认配置
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- LSP 附加事件处理
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- 设置键位映射
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			-- 配置具体的 LSP 服务器
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})
		end,
	},

	-- mason-lspconfig
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = lsp_services,
			automatic_installation = true,
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	-- conform.nvim
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				javascriptreact = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				scss = { "prettier" },
			},
		},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ lsp_callback = true, async = true })
				end,
				desc = "format code",
			},
		},
	},
}
