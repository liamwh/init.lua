return {
    {
        -- Svelte
        "leafOfTree/vim-svelte-plugin",
        dependencies = { "othree/html5.vim", "pangloss/vim-javascript" },
    },
    {
        "bufbuild/tree-sitter-cel",
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
                "jsonc",
                "http",
                "gitignore",
                "gitcommit",
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
                "gotmpl",
                "gomod",
                "gosum",
                "bash",
                -- devops,
                "terraform",
                "dockerfile",
                "hurl",
                "nix",
                "helm",
                "cue",
                "hcl",
                "bicep",
                -- low-level
                "c",
                "llvm",
                "zig",
                -- other programming languages
                "elixir",
                "gleam",
                "ocaml",
                "php",
                "c",
                "cpp",
                "kotlin",
                "c_sharp",
                "java",
                "clojure",
                "python",
                "ruby",
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
                -- Authorisation
                "rego",
                "authzed",
                -- Interface Description Languages
                "smithy",
                "proto",
                "wit", -- webassembly
                -- blockchain
                "solidity",
                -- configuration languages
                "ssh_config",
                "hyprlang",
                "kdl",
                "kconfig",
                -- the rest
                "latex",
                "jq",
                "query",
                "gpg",
                "vim",
                "vimdoc",
                "query", -- Tree Sitter query
                "vhs",
                "xml",
                "graphql",
            },
        },
    },
}
