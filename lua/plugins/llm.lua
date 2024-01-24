return {
    {
        "https://github.com/David-Kunz/gen.nvim",
        config = function()
            require("gen").model = "mistral"
            require("gen").prompts["Document_Code"] = {
                prompt =
                "Add doc comments to the following code. In Rust files, they are denoted by `///`. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
                replace = true,
                extract = "```$filetype\n(.-)```",
            }
        end,
    },
    {
        'stevearc/dressing.nvim',
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "nomnivore/ollama.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- All the user commands added by the plugin
        cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
        opts = {
            prompts = {
                Document_Rust_Code = {
                    prompt =
                    "Add doc comments to the following code. In Rust files, they are denoted by `///`.",
                    input_label = "> ",
                    model = "mistral",
                    action = "display",
                }
            }
        },
        keys = {
            -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
            {
                "<leader>oo",
                ":<c-u>lua require('ollama').prompt()<cr>",
                desc = "ollama prompt",
                mode = { "n", "v" },
            },

            -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
            {
                "<leader>oG",
                ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
                desc = "ollama Generate Code",
                mode = { "n", "v" },
            },
        },
    },
}
