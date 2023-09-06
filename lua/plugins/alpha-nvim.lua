return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function(_, _)
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
██╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
██║   ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██║   ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
╚██╗ ██╔╝██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ╚████╔╝ ███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═══╝  ╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]]
        dashboard.section.header.val = vim.split(logo, "\n")
    end,
}
