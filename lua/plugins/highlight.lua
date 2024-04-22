-- Be sure to run
-- cp -r queries ~/.local/share/nvim/lazy/nvim-treesitter/queries/wit
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.wit = {
--     install_info = {
--         url = "https://github.com/liamwh/tree-sitter-wit.git", -- local path or git repo
--         files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
--         branch = "main", -- default branch in case of git repo if different from master
--         maintainers = "@liamwh", -- user to be mentioned as maintainer
--         generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--         requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
--     },
--     filetype = "wit", -- if filetype does not match the parser name
-- }
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
                "graphql",
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
                -- blockchain
                "solidity",
                -- WebAssembly
                "wit",
                -- rest
                "c_sharp",
                "java",
                "elixir",
                "gleam",
                "ocaml",
                "php",
                "kotlin",
                "jq",
                "ssh_config",
                "python",
                "query",
                "vim",
                "kconfig",
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
