return {
    -- "https://github.com/ashinkarov/nvim-agda.git",
    -- config = function()
    --     local utf8 = require 'lua-utf8'
    --     vim.g.nvim_agda_settings = {
    --         agda = "/usr/bin/agda",
    --         debug_p = true
    --     }
    -- end,
    { "https://github.com/ashinkarov/nvim-agda.git" },
    {
        'isti115/agda.nvim',
        dependencies = { "nvim-lua/plenary.nvim" },
        vim.api.nvim_set_keymap("n", "<localleader>l", ":lua require('agda').load()<CR>",
            { noremap = true, silent = true })
    }
    -- {
    --     "https://github.com/isovector/cornelis.git"
    -- }
}
