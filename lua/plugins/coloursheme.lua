-- Uncomment if experiencing any issues with lazygit inside Neovim
-- vim.g.lazygit_theme = false
return {
    {
        "Shatur/neovim-ayu",
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "dracula",
        },
    },
    {
        "https://github.com/Mofiqul/dracula.nvim.git",
    },
}
