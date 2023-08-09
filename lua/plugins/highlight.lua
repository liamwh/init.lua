return {
    {
        -- Svelte
        "leafOfTree/vim-svelte-plugin",
        dependencies = { "othree/html5.vim", "pangloss/vim-javascript" },
    },
    {
        -- Justfiles
        "vmchale/just-vim",
    },
    {
        -- Language parsers
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "svelte",
                "rust",
                "go",
                "dockerfile",
                "toml",
                "terraform",
            },
        },
    },
}
