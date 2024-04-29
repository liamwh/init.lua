return {
    {
        -- support auto-detecting and selecting yaml schemas.
        -- use ":Telescope yaml_schema" to change current schema.
        "someone-stole-my-name/yaml-companion.nvim",
        ft = { "yaml" },
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = function(_, opts)
            local cfg = require("yaml-companion").setup(opts)
            require("lspconfig")["yamlls"].setup(cfg)
            require("telescope").load_extension("yaml_schema")
        end,
        keys = { { "<leader>ys", "<cmd>Telescope yaml_schema<cr>", desc = "Select YAML schema" } },
    },

    -- Show currently used yaml-schema on lualine status bar
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.sections.lualine_z = {
                {
                    function()
                        local schema = require("yaml-companion").get_buf_schema(0)
                        if schema.result[1].name == "none" then
                            return ""
                        end
                        return schema.result[1].name
                    end,
                },
                opts.sections.lualine_z,
            }
        end,
    },
}
