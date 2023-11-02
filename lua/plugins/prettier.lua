return {
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            nls.builtins.formatting.prettierd.with({
                extra_filetypes = { "svelte" },
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "prettierd",
                "codelldb",
                "powershell-editor-services",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["svelte"] = { { "prettierd", "prettier" } },
            },
        },
    },
}
