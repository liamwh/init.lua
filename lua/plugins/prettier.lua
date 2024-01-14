return {
    -- {
    --     "nvimtools/none-ls.nvim",
    --     opts = function(_, opts)
    --         local nls = require("null-ls")
    --         nls.builtins.formatting.prettierd.with({
    --             extra_filetypes = { "svelte" },
    --         })
    --     end,
    -- },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["svelte"] = { { "prettierd", "prettier" } },
                ["js"] = { { "prettierd", "prettier" } },
                ["ts"] = { { "prettierd", "prettier" } },
            },
        },
    },
}
