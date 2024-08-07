-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.opt.clipboard = "unnamedplus"

-- I installed win32yank using scoop, then symlinked it to /usr/local/bin
-- sudo ln -s "/mnt/c/Users/YourUsername/scoop/shims/win32yank.exe" "/usr/local/bin/win32yank"
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "wslclipboard",
        copy = {
            ["+"] = "/usr/local/bin/win32yank -i --crlf",
            ["*"] = "/usr/local/bin/win32yank -i --crlf",
        },
        paste = {
            ["+"] = "/usr/local/bin/win32yank -o --lf",
            ["*"] = "/usr/local/bin/win32yank -o --lf",
        },
        cache_enabled = 1,
    }
end

-- Auto fmt .feature files using ghokin on save
vim.api.nvim_command("autocmd BufWritePost *.feature !ghokin fmt replace " .. vim.fn.expand("%:p:h"))

vim.api.nvim_command("command! Unix !dos2unix %")

-- treat .tfstate files as json
vim.api.nvim_create_augroup("filetype_tfstate", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tfstate",
    command = "set filetype=json",
    group = "filetype_tfstate",
})

-- treat .env.example files akin to .env files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.env.example",
    command = "set filetype=sh",
})

-- Use markdown when using firenvim to write Markdown on GitHub
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "github.com_*.txt",
    callback = function()
        vim.bo.filetype = "markdown"
    end,
})
-- Make sure markdown files use 2 spaces for indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- Save the default mini.surround configuration
local default_surround_config = require("mini.surround").config

-- Define custom surround settings for markdown files
local markdown_surround_config = vim.tbl_deep_extend("force", {}, default_surround_config, {
    custom_surroundings = {
        ["["] = {
            input = { "%[.-%]" },
            output = { left = "[", right = "]" },
        },
    },
})

-- Make mini surround not add spaces for [] in markdown files
-- Autocmd to set custom surround settings for markdown files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        require("mini.surround").setup(markdown_surround_config)
    end,
})

-- Autocmd to revert to default surround settings when leaving markdown files
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        require("mini.surround").setup(default_surround_config)
    end,
})

-- Function to create a markdown link using clipboard content if it is a link
_G.custom_paste = function()
    -- Get the clipboard content
    local clipboard = vim.fn.getreg("+")

    -- Check if the clipboard content is a link (simple regex check)
    if clipboard:match("^https?://") then
        -- Get the selected text
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")

        -- Read the selected text
        local selected_text = vim.fn.getline(start_pos[2]):sub(start_pos[3], end_pos[3])

        -- Create the markdown link
        local markdown_link = string.format("[%s](%s)", selected_text, clipboard)

        -- Replace the selected text with the markdown link
        vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], { markdown_link })
    else
        -- If not a link, replace the selected text with the clipboard content
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")

        local clipboard_lines = vim.split(clipboard, "\n")
        vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], clipboard_lines)
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        -- Create a key mapping in visual mode for markdown files
        vim.api.nvim_buf_set_keymap(0, "v", "p", ":lua custom_paste()<CR>", { noremap = true, silent = true })
    end,
})
