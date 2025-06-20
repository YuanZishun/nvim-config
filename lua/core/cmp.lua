return {
	'saghen/blink.cmp',
	-- optional: provides snippets for the snippet source
	dependencies = { 'rafamadriz/friendly-snippets' },

	version = '1.*',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter"
		},
		completion = {
				ghost_text = {
						enabled = true,
				}
		}
	},
}
