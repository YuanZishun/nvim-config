local lsp_services = {
	"lua_ls", "vtsls", "cssls"
}

local formatters = {
	"prettier", "eslint_d", "stylua"
}

return {
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ "gd", vim.lsp.buf.definition, desc = "go definition" },
			{ "K",  vim.lsp.buf.hover,      desc = "show hover" },
		},
		config = function()
			local lspconfig = require('lspconfig')
		end
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	},


	-- mason-lspconfig
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

	-- conform.nvim
	{
		'stevearc/conform.nvim',
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
			{ "<leader>cf", function() require('conform').format() end, desc = "format code" }
		}
	}
}
