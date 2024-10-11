if vim.g.vscode then
    return {}
else
    return {
        {
            "OlegGulevskyy/better-ts-errors.nvim",
            dependencies = { "MunifTanjim/nui.nvim" },
            config = {
                keymaps = {
                    toggle = "<leader>dd",
                },
            },
        },
        {
            "MunifTanjim/nui.nvim",
            lazy = true,
        },
    }
end
