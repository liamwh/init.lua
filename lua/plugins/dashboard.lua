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
        return opts
    end,
}
