return {
    {
        "gcmt/wildfire.vim",
        lazy = false,
        vim.api.nvim_set_keymap("n", "<leader>ss", "<Plug>(wildfire-quick-select)", { noremap = true, silent = true }),
    },
}
