return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")

		-- 基础配置
		notify.setup({
			timeout = 2000,
			max_height = function()
				return math.floor(vim.o.lines * 0.5)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.3)
			end,
			stages = "fade_in_slide_out",
			render = "minimal",
			background_colour = "NotifyBackground",

			-- 自定义图标
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "",
			},
		})

		-- 替换默认通知系统
		vim.notify = notify

		-- 自定义通知样式
		vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "DiagnosticError" })
		vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "DiagnosticWarn" })
		vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "DiagnosticInfo" })
	end,
}
