return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
			{"<leader><leader>", "<cmd>Telescop find_files<cr>", desc = "Find Files"}
	}
}
