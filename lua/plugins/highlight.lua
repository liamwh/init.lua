return {
    {
        -- Svelte
        "leafOfTree/vim-svelte-plugin",
        dependencies = { "othree/html5.vim", "pangloss/vim-javascript" },
    },
    {
        "luckasRanarison/tree-sitter-hyprlang",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
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
                "css",
                "scss",
                "sql",
                "javascript",
                "jsdoc",
                "jq",
                "json",
                "lua",
                "markdown",
                "mermaid",
                "markdown_inline",
                "python",
                "proto",
                "rego",
                "prisma",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
                "svelte",
                "rust",
                "ron",
                "go",
                "dockerfile",
                "toml",
                "terraform",
                "vhs",
            },
        },
    },
}
