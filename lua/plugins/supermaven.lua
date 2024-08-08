return {
    {
        "supermaven-inc/supermaven-nvim",
        enabled = true,
        config = function()
            require("supermaven-nvim").setup({
                log_level = "info",
                keymaps = {
                    accept_suggestion = "<C-]>",
                    clear_suggestion = "<C-[>",
                    accept_word = "<C-j>",
                },
            })
        end,
    },
    {
        "nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, 1, {
                name = "supermaven",
                group_index = 1,
                priority = 100,
            })
        end,
    },
    {
        "folke/noice.nvim",
        optional = true,
        opts = function(_, opts)
            vim.list_extend(opts.routes, {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "Starting Supermaven" },
                            { find = "Supermaven Free Tier" },
                        },
                    },
                    skip = true,
                },
            })
        end,
    },
}
