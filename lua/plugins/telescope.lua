return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader><leader>", "<cmd>Telescop find_files<cr>", desc = "Find Files" },
		{ "<leader>xx", "<cmd>Telescop diagnostics<cr>", desc = "Show All Diagnostics" },
		{ "<leader>b", "<cmd>Telescop buffers<cr>", desc = "Show All Buffers" },
		{ "<leader>sg", "<cmd>Telescop live_grep<cr>", desc = "Live Grep" },
	},
}
