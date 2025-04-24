return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Buffer Pick" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Others Buffer" },
		{ "<leader>bd", "<cmd>bd<cr>", desc = "Delete Buffer" },
	},
	opts = {
		options = {
			themable = true,
			offsets = {
				{
					filetype = "neo-tree",
					text = function()
						return vim.fn.getcwd()
					end,
					highlight = "Directory",
					text_align = "left",
				},
			},
			show_buffer_close_icons = false,
			separator_style = "slant",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
