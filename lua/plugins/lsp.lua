return {
    "neovim/nvim-lspconfig",
    opts = function()
        require("lspconfig").cssmodules_ls.setup({
            init_options = {
                camelCase = false,
            },
        })
    end,
}
