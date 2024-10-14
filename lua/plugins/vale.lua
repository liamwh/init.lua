return {
    "dense-analysis/ale",
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_linters = {
            markdown = { "vale" },
            reStructuredText = { "vale" },
            LaTeX = { "vale" },
            Mail = { "vale" },
        }
    end,
}
