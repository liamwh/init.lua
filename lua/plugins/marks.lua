return {
    "chentoast/marks.nvim",
    config = function()
        require("marks").setup({
            default_mappings = true,
            -- which builtin marks to show. default {}
            builtin_marks = { ".", "<", ">", "^", "'" },
            -- whether movements cycle back to the beginning/end of buffer. default true
            cyclic = true,
            -- whether the shada file is updated after modifying uppercase marks. default false
            force_write_shada = true,
            -- how often (in ms) to redraw signs/recompute mark positions.
            -- higher values will have better performance but may cause visual lag,
            -- while lower values may cause performance penalties. default 150.
            refresh_interval = 150,
            -- disables mark tracking for specific filetypes. default {}
            excluded_filetypes = {},
            -- disables mark tracking for specific buftypes. default {}
            excluded_buftypes = {},
            mappings = {
                set_next = "m,",
                next = "m]",
                prev = "m[",
                preview = "m:",
            },
        })
    end,
}
