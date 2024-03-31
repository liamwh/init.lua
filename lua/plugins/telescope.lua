return {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
        local telescopeConfig = require("telescope.config")

        -- Clone the default Telescope configuration
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

        -- I want to search in hidden/dot files.
        table.insert(vimgrep_arguments, "--hidden")

        -- I don't want to search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")

        -- I don't want to search in `.env` files.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**.env")

        opts.pickers = opts.pickers or {}
        opts.pickers.defaults = {
            vimgrep_arguments = vimgrep_arguments,
        }
        opts.pickers.find_files = {
            reuse_win = true,
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob",
                "!**/.git/*",
                "--glob",
                "!**.env"
            },
        }
        opts.pickers.live_grep = {
            reuse_win = true,
        }
        opts.pickers.buffers = {
            reuse_win = true,
        }

        return opts
    end,
}
