return {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
        local rainbow_delimiters = require 'rainbow-delimiters'
        vim.g.rainbow_delimiters = {
            highlight = {
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end
}
