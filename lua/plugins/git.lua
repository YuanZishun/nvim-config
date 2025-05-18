return {
    {
        "NeogitOrg/neogit",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
        },
    },

    {
        "sindrets/diffview.nvim",
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff View" },
        },
    },
}
