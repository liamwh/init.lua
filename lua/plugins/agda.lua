return {
    "https://github.com/ashinkarov/nvim-agda.git",
    config = function()
        local utf8 = require 'lua-utf8'
        vim.g.nvim_agda_settings = {
            agda = "/usr/bin/agda",
            debug_p = true
        }
    end,
}
