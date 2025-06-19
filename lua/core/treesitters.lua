return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "lua",
                "markdown",
                "markdown_inline",
                "bash",
                "css",
                "dart",
                "git_config",
                "git_rebase",
                "gitignore",
                "html",
                "jsdoc",
                "json",
                "javascript",
                "scss",
                "tsx",
                "typescript",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
