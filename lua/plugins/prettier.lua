return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            nls.builtins.formatting.prettierd.with({
                extra_filetypes = { "svelte" },
            })
            table.insert(opts.sources, nls.builtins.formatting.prettierd)
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "prettier",
                "prettierd",
            },
        },
    },
}
