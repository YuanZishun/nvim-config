-- 诊断浮动窗口样式优化
local M = {}

-- 自定义浮动窗口样式
local function setup_diagnostic_float()
	-- 设置诊断浮动窗口的样式
	vim.diagnostic.config({
		float = {
			border = "rounded", -- 圆角边框
			source = true, -- 总是显示来源
			header = "", -- 移除头部
			prefix = function(diagnostic)
				local icons = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				}
				return icons[diagnostic.severity] or " "
			end,
			format = function(diagnostic)
				if diagnostic.source == "eslint" then
					return string.format("%s [ESLint] %s", diagnostic.message, diagnostic.code or "")
				end
				return string.format("%s", diagnostic.message)
			end,
			-- 添加更多样式选项
			max_width = 80,
			max_height = 20,
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			bufnr = nil,
			scope = "line",
		},
		virtual_text = {
			prefix = "●",
			spacing = 4,
			source = "if_many",
			severity = {
				min = vim.diagnostic.severity.HINT,
			},
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = " ",
				[vim.diagnostic.severity.INFO] = " ",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			},
			linehl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
				[vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
			},
		},
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})

	-- 自定义浮动窗口的高亮组
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			-- 设置浮动窗口边框颜色
			vim.api.nvim_set_hl(0, "FloatBorder", {
				fg = "#7aa2f7",
				bg = "NONE",
				bold = true,
			})

			-- 设置浮动窗口背景
			-- vim.api.nvim_set_hl(0, "NormalFloat", {
			-- 	bg = "#1a1b26",
			-- 	fg = "#c0caf5",
			-- })

			-- 设置诊断信息的高亮
			vim.api.nvim_set_hl(0, "DiagnosticError", {
				fg = "#f7768e",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "DiagnosticWarn", {
				fg = "#e0af68",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "DiagnosticInfo", {
				fg = "#7aa2f7",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "DiagnosticHint", {
				fg = "#bb9af7",
				bold = true,
			})

			-- 设置诊断行高亮
			vim.api.nvim_set_hl(0, "DiagnosticLineError", {
				bg = "#2d1b1b",
				sp = "#f7768e",
				underline = false,
			})
			vim.api.nvim_set_hl(0, "DiagnosticLineWarn", {
				bg = "#2d2b1b",
				sp = "#e0af68",
				underline = false,
			})
			vim.api.nvim_set_hl(0, "DiagnosticLineInfo", {
				bg = "#1b1b2d",
				sp = "#7aa2f7",
				underline = false,
			})
			vim.api.nvim_set_hl(0, "DiagnosticLineHint", {
				bg = "NONE",
				sp = "#bb9af7",
				underline = false,
			})

			-- 设置诊断符号高亮
			vim.api.nvim_set_hl(0, "DiagnosticSignError", {
				fg = "#f7768e",
				bg = "NONE",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "DiagnosticSignWarn", {
				fg = "#e0af68",
				bg = "NONE",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "DiagnosticSignInfo", {
				fg = "#7aa2f7",
				bg = "NONE",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "DiagnosticSignHint", {
				fg = "#bb9af7",
				bg = "NONE",
				bold = true,
			})
		end,
	})

	-- 立即应用高亮设置
	vim.api.nvim_exec_autocmds("ColorScheme", {})
end

-- 设置键盘映射
local function setup_keymaps()
	-- 打开诊断浮动窗口
	vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, {
		desc = "打开诊断信息",
		noremap = true,
		silent = true,
	})

	-- 跳转到下一个诊断
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
		desc = "上一个诊断",
		noremap = true,
		silent = true,
	})

	-- 跳转到上一个诊断
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
		desc = "下一个诊断",
		noremap = true,
		silent = true,
	})

	-- 设置诊断位置列表
	vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, {
		desc = "显示诊断位置列表",
		noremap = true,
		silent = true,
	})
end

-- 自定义浮动窗口函数
local function custom_open_float()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		source = "always",
		header = "",
		prefix = function(diagnostic)
			local icons = {
				Error = "",
				Warn = "",
				Hint = " ",
				Info = " ",
			}
			return icons[diagnostic.severity] or " "
		end,
		format = function(diagnostic)
			if diagnostic.source == "eslint" then
				return string.format("%s [ESLint] %s", diagnostic.message, diagnostic.code or "")
			end
			return string.format("%s", diagnostic.message)
		end,
		max_width = 80,
		max_height = 20,
	}

	vim.diagnostic.open_float(0, opts)
end

function M.setup()
	setup_diagnostic_float()
	setup_keymaps()

	-- 替换默认的 open_float 函数
	vim.diagnostic.open_float = custom_open_float
end

return M
