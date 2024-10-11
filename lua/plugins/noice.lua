if vim.g.vscode then
    return {}
else
    return {
        "folke/noice.nvim",
        cond = not vim.g.started_by_firenvim or not vim.g.vscode,
    }
end
