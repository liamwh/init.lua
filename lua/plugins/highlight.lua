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
            highlight = {
                enable = true,
            },
            ensure_installed = {
                -- staples
                "json",
                "http",
                "gitignore",
                "git_config",
                "gitattributes",
                "yaml",
                "lua",
                "dockerfile",
                "toml",
                "bash",
                "regex",
                "sql",
                "toml",
                "yaml",
                "diff",
                -- web dev
                "svelte",
                "astro",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "scss",
                "jsdoc",
                "prisma",
                -- backend
                "rust",
                "ron",
                "go",
                "gowork",
                "gomod",
                "gosum",
                "bash",
                -- devops,
                "terraform",
                "dockerfile",
                "nix",
                "helm",
                "cue",
                "hcl",
                "bicep",
                -- low-level
                "c",
                "llvm",
                "zig",
                -- Documentation
                "markdown",
                "markdown_inline",
                "mermaid",
                "vhs",
                -- functional
                "haskell",
                "agda",
                -- terminal
                "tmux",
                -- rest
                "c_sharp",
                "elixir",
                "gleam",
                "java",
                "ocaml",
                "php",
                "kotlin",
                "jq",
                "ssh_config",
                "python",
                "proto",
                "rego",
                "query",
                "vim",
                "ruby",
                "vimdoc",
                "query", -- Tree Sitter query
                "kdl",
                "hyprlang",
                "vhs",
                "xml",
            },
        },
    },
}
