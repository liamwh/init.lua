---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'ayu_dark'}
 M.plugins = 'custom.plugins'
 vim.opt.scrolloff = 8
 vim.opt.relativenumber = true
 vim.opt.smartindent = true
 vim.opt.tabstop = 4
 vim.opt.softtabstop = 4
 vim.opt.shiftwidth = 4
 vim.opt.expandtab = true
 vim.opt.wrap = false
 vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
 vim.opt.undofile = true
 vim.opt.hlsearch = false
 vim.opt.termguicolors = true
 vim.opt.colorcolumn = "100"
 vim.opt.signcolumn = "yes"
-- Custom mappings
M.custom = {
  mappings = {
    normal = {
      { "F2", "<cmd>lua vim.lsp.buf.rename()<CR>" }
    }
  }
}
 return M
