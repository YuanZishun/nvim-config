local lsp_services = {
	"lua_ls", "vtsls", "cssmodules_ls", "cssls"
}

local formatters = {
	"prettier", "eslint_d", "stylua"
}
return {
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ "<leader>cf", vim.lsp.buf.format,     desc = "format code" },
			{ "gd",         vim.lsp.buf.definition, desc = "go definition" },
			{ "K",          vim.lsp.buf.hover,      desc = "show hover" }
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",

		opts = {
			ensure_installed = lsp_services,
			automatic_enable = true
		},

		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig"
		}
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opts = {
			ensure_installed = formatters,
			automatic_enable = true,
		}
	}
}
