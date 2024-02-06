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
                -- staples
                "json",
                "gitignore",
                "yaml",
                "lua",
                "dockerfile",
                "toml",
                "bash",
                "regex",
                "sql",
                -- web dev
                "svelte",
                "astro",
                "javascript",
                "tsx",
                "typescript",
                "html",
                "css",
                "scss",
                "jsdoc",
                "prisma",
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
                -- Documentation
                "markdown",
                "markdown_inline",
                "mermaid",
                "vhs",
                -- rest
                "c",
                "agda",
                "diff",
                "jq",
                "ssh_config",
                "python",
                "proto",
                "rego",
                "query",
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
