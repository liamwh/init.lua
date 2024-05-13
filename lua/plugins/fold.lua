return {
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup({})
        end,
    },
    {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
            "anuvyklack/keymap-amend.nvim",
        },
        config = function()
            require("fold-preview").setup({
                -- TODO: Custom configuration if I decide to invest time in folds
            })
        end,
    },
}
