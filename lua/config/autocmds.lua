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
vim.api.nvim_create_augroup('filetype_tfstate', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = '*.tfstate',
    command = 'set filetype=json',
    group = 'filetype_tfstate',
})

-- treat .env.example files akin to .env files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.env.example",
    command = "set filetype=sh",
})

-- Use markdown when using firenvim to write Markdown on GitHub
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = "github.com_*.txt",
    callback = function()
        vim.bo.filetype = "markdown"
    end
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
