return {
    {
        "mrcjkb/rustaceanvim",
        keys = {
            { "<leader>cd", "<cmd>RustLsp openDocs<CR>", desc = "Open Docs.rs for Symbol" },
        },
    },
    {
        -- the below is recommended by rustaceanvim
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                rust_analyzer = function()
                    return true
                end,
            },
        },
    },
}
