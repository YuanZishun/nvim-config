return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		integrations = {
			gitsigns = true,
			neotree = true,
			treesitter = true,
			blink_cmp = true,

			mini = { enabled = true, indentscope_color = "" },
		},
	},
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
