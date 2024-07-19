return {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
        local actions = require("fzf-lua.actions")
        opts.grep = vim.tbl_deep_extend("force", opts.grep, {
            actions = {
                ["ctrl-g"] = false,
                ["alt-g"] = actions.grep_lgrep,
            },
        })
    end,
}
