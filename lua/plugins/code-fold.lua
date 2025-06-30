return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"nvim-treesitter/nvim-treesitter", -- 必须依赖
	},
	config = function()
		local ufo = require("ufo")
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end
		-- UFO 主配置
		ufo.setup({
			close_fold_kinds_for_ft = {
				default = { 'imports', 'comment' },
				json = { 'array' },
			},
			fold_virt_text_handler = handler, -- 应用自定义处理器
			provider_selector = function(_, filetype, _)
				return { "treesitter", "indent" } -- 折叠提供源
			end,
			preview = {
				win_config = {
					border = "rounded",                  -- 预览窗口边框样式
					winhighlight = "Normal:Normal,FloatBorder:Comment", -- 高亮设置
				},
			},
		})

		-- 快捷键设置
		vim.keymap.set("n", "zR", ufo.openAllFolds)
		vim.keymap.set("n", "zM", ufo.closeAllFolds)
		vim.keymap.set("n", "zp", ufo.peekFoldedLinesUnderCursor)
	end,
}
