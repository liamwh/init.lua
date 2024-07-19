return {
    "nvimdev/dashboard-nvim",
    enabled = true,
    opts = function(_, opts)
        local dashboard_custom_header = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "      ████ ██████           █████      ██                    ",
            "     ███████████             █████                            ",
            "     █████████ ███████████████████ ███   ███████████  ",
            "    █████████  ███    █████████████ █████ ██████████████  ",
            "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
            " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
            "██████  █████████████████████ ████ █████ █████ ████ ██████",
            "",
            "",
            "",
            "",
        }
        opts.config.header = dashboard_custom_header
        for i, item in ipairs(opts.config.center) do
            if item.desc and item.desc:find(" Find Text") then
                opts.config.center[i].key = "/"
                break
            end
        end
        local lazygit_action = {
            action = function()
                LazyVim.lazygit({ cwd = LazyVim.root.git() })
            end,
            desc = " Lazygit" .. string.rep(" ", 36),
            icon = " ",
            key = "g",
        }
        table.insert(opts.config.center, 3, lazygit_action)
        for _, item in ipairs(opts.config.center) do
            item.key_format = " %s "
        end
        return opts
    end,
}
