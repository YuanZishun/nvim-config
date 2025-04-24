require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "vtsls"}
})
local lspconfig = require'lspconfig'

require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    ["lua_ls"] = function ()
        lspconfig.lua_ls.setup{
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
    ["vtsls"] = function ()
        lspconfig.vtsls.setup{}
    end
}

-- Keymap
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

-- ui
-- 对错误警告的图标
vim.diagnostic.config({
        virtual_text = true,
        signs = true,
 -- 在输入模式下也更新提示，设置为 true 也许会影响性能
 update_in_insert = true,
})
local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for type, icon in pairs(signs) do
 local hl = "DiagnosticSign" .. type
 vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
