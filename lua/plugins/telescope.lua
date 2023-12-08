return {
    "nvim-telescope/telescope.nvim",
    opts = {
        pickers = {
            find_files = {
                reuse_win = true,
            },
            live_grep = {
                reuse_win = true,
            },
            buffers = {
                reuse_win = true,
            },
        },
    },
}
