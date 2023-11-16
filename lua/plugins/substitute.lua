return {
    "gbprod/substitute.nvim",
    config = function(_, _)
        require("substitute").setup({
            on_substitute = require("yanky.integration").substitute(),
        })
    end,
}
