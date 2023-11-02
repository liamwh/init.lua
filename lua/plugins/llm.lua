return {
    "https://github.com/David-Kunz/gen.nvim",
    config = function()
        require("gen").model = "codellama"
        require("gen").prompts["Document_Code"] = {
            prompt = "Add doc comments to the following code. In Rust files, they are denoted by `///`. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
            replace = true,
            extract = "```$filetype\n(.-)```",
        }
    end,
}
