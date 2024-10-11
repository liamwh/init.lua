return {
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },
    {
        "vscode-neovim/vscode-multi-cursor.nvim",
        dependencies = { "folke/flash.nvim" },
        event = "VeryLazy",
        cond = not not vim.g.vscode,
        opts = {},
    },
}
