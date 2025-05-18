return {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
        formatters = {
            prettier = {
                pretend_args = {
                    "--single-quote",
                },
                args = {
                    "--stdin-filepath",
                    "$FILENAME",
                },
            },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            html = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            json = { "prettier" },
        },
    },
}
