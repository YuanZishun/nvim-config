return {
	"s1n7ax/nvim-window-picker",
	event = "VeryLazy",
	config = function()
		require("window-picker").setup({
			-- 窗口选择器的样式配置
			selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
			filter_rules = {
				-- 过滤掉某些窗口类型
				bo = {
					-- 排除浮动窗口
					filetype = { "notify", "lazy", "mason" },
					buftype = { "terminal" },
				},
			},
			-- 高亮配置
			highlights = {
				statusline = {
					focused = {
						fg = "#7aa2f7",
						bg = "#1a1b26",
						bold = true,
					},
					unfocused = {
						fg = "#565a6e",
						bg = "#1a1b26",
						bold = true,
					},
				},
				winbar = {
					focused = {
						fg = "#7aa2f7",
						bg = "#1a1b26",
						bold = true,
					},
					unfocused = {
						fg = "#565a6e",
						bg = "#1a1b26",
						bold = true,
					},
				},
			},
		})
	end,
} 