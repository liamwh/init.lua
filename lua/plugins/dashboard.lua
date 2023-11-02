return {
    {
        "nvimdev/dashboard-nvim",
        enabled = false,
    },
    {
        "goolord/alpha-nvim",
        enabled = true,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function(_, _)
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
      ████ ██████           █████      ██
     ███████████             █████ 
     █████████ ███████████████████ ███   ███████████
    █████████  ███    █████████████ █████ ██████████████
   █████████ ██████████ █████████ █████ █████ ████ █████
 ███████████ ███    ███ █████████ █████ █████ ████ █████
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]]
            dashboard.section.header.val = vim.split(logo, "\n")
        end,
    },
}
