return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader><space>",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
		},
	},
}
