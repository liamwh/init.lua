-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.g.lazyvim_picker = "fzf"
-- vim.g.lazyvim_picker = "telescope"

vim.opt.swapfile = false
vim.opt.backup = false

-- Use the system keyboard
vim.opt.clipboard = "unnamedplus"

-- Set undodir depending on OS
if package.config:sub(1, 1) == "\\" then
    vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
end
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono_Nerd_Font_Mono:h14"
end

vim.filetype.add({
    extension = {
        postcss = "css",
    },
})

-- Set the Lua package paths for Neovim
local home = os.getenv("HOME")
package.path = package.path
    .. ";"
    .. home
    .. "/.luarocks/share/lua/5.1/?.lua;"
    .. home
    .. "/.luarocks/share/lua/5.1/?/init.lua;"

package.cpath = package.cpath .. ";" .. home .. "/.luarocks/lib/lua/5.1/?.so;"

-- Set the Python path for Neovim
vim.g.python3_host_prog = "~/.config/nvim/py3nvim/bin/python"

-- Neovide
vim.g.neovide_scroll_animation_length = 0.2

-- Add mdx filetype
vim.filetype.add({
    extension = {
        mdx = "markdown",
    },
})

vim.filetype.add({
    extension = {
        hurl = "hurl",
    },
})

-- Disable messages like "X lines yanked"
vim.opt.report = 10000

-- ensures that the status line is always visible as a single global status line for all windows, rather than having a separate status line for each window.
vim.opt.laststatus = 3
