return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>ue",
            function()
                require("edgy").toggle()
            end,
            desc = "Edgy Toggle",
        },
    -- stylua: ignore
    { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = function()
        local opts = {
            bottom = {
                {
                    ft = "toggleterm",
                    size = { height = 0.4 },
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
                {
                    ft = "noice",
                    size = { height = 0.4 },
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
                {
                    ft = "lazyterm",
                    title = "Terminal",
                    size = { height = 0.4 },
                    filter = function(buf)
                        return not vim.b[buf].lazyterm_cmd
                    end,
                },
                {
                    ft = "help",
                    size = { height = 20 },
                    -- don't open help files in edgy that we're editing
                    filter = function(buf)
                        return vim.bo[buf].buftype == "help"
                    end,
                },
                { ft = "qf", title = "QuickFix" },
            },
            right = {
                "Trouble",
                { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
                { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
                { title = "Hurl Nvim", size = { width = 0.5 }, ft = "hurl-nvim" },
            },
            left = {
                {
                    title = "Neo-Tree",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "filesystem"
                    end,
                    pinned = true,
                    open = function()
                        require("neo-tree.command").execute({ dir = LazyVim.root() })
                    end,
                    size = { height = 0.5 },
                },
                { title = "Neotest Summary", ft = "neotest-summary" },
                {
                    title = "Neo-Tree Git",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "git_status"
                    end,
                    pinned = true,
                    open = "Neotree position=right git_status",
                },
                {
                    title = "Neo-Tree Buffers",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "buffers"
                    end,
                    pinned = true,
                    open = "Neotree position=top buffers",
                },
                "neo-tree",
            },
            keys = {
                -- increase width
                ["<c-Right>"] = function(win)
                    win:resize("width", 5)
                end,
                -- decrease width
                ["<c-Left>"] = function(win)
                    win:resize("width", -5)
                end,
                -- increase height
                ["<c-Up>"] = function(win)
                    win:resize("height", 5)
                end,
                -- decrease height
                ["<c-Down>"] = function(win)
                    win:resize("height", -5)
                end,
            },
            animate = {
                enabled = false,
            },
        }
        -- Edgy Aerial configuration
        local edgy_idx = LazyVim.plugin.extra_idx("ui.edgy")
        local aerial_idx = LazyVim.plugin.extra_idx("editor.aerial")
        if edgy_idx and edgy_idx > aerial_idx then
            LazyVim.warn(
                "The `edgy.nvim` extra must be **imported** before the `aerial.nvim` extra to work properly.",
                {
                    title = "LazyVim",
                }
            )
        end
        opts.right = opts.right or {}
        table.insert(opts.right, {
            title = "Aerial",
            ft = "aerial",
            pinned = true,
            open = "AerialOpen",
        })
        return opts
    end,
}
