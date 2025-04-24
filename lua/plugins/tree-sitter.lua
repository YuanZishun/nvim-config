return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		version = false,
		event = { "VeryLazy" },
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"javascript",
					"html",
					"tsx",
					"typescript",
					"yaml",
					"xml",
					"regex",
					"jsdoc",
					"diff",
					"bash",
				},
				sync_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
