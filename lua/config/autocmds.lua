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
