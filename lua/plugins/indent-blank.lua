return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		-- 缩进线配置
		indent = {
			-- 使用更淡的字符，减少与诊断的冲突
			char = "┊",
			-- 智能缩进
			smart_indent_cap = true,
		},
		-- 作用域配置
		scope = {
			-- 显示作用域
			enabled = true,
			-- 作用域字符
			char = "┊",
			show_start = false,
		},
		-- 排除的文件类型
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
		-- 空白字符配置
		whitespace = {
			highlight = {
				"Whitespace", -- 基础空白高亮
				"NonText" -- 非文本区域高亮
			},
			-- 移除尾随空格
			remove_blankline_trail = false,
		},
	},
}
