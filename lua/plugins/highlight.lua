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
            highlight = {
                enable = true,
            },
            ensure_installed = {
                -- web dev
                "svelte",
                "astro",
                "javascript",
                "tsx",
                "typescript",
                "html",
                "css",
                "scss",
                -- backend
                "rust",
                "ron",
                "go",
                "bash",
                -- devops,
                "terraform",
                "hcl",
                -- low-level
                "c",
                "zig",
                -- rest
                "c_sharp",
                "diff",
                "gitignore",
                "sql",
                "jsdoc",
                "jq",
                "json",
                "lua",
                "mermaid",
                "markdown",
                "markdown_inline",
                "ssh_config",
                "python",
                "proto",
                "rego",
                "prisma",
                "query",
                "regex",
                "vim",
                "vimdoc",
                "yaml",
                "dockerfile",
                "toml",
                "vhs",
                "xml",
            },
        },
    },
}
