-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("x", "<Up>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<Down>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "di", '"_di', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>th",
    ":split <bar> terminal<CR>i",
    { noremap = true, silent = true, desc = "Open new terminal" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>tv",
    ":vsplit <bar> terminal<CR>i",
    { noremap = true, silent = true, desc = "Open new terminal" }
)

-- Ollama / gen.nvim
-- vim.api.nvim_set_keymap("n", "<leader>l", ":Gen<CR>", { noremap = true, silent = true, desc = "LLM" })
-- vim.api.nvim_set_keymap("v", "<leader>l", ":Gen<CR>", { noremap = true, silent = true, desc = "LLM" })

vim.api.nvim_set_keymap(
    "n",
    "<M-Right>",
    "<C-w>5<",
    { noremap = false, silent = true, desc = "Decrease width on the left" }
)
vim.api.nvim_set_keymap(
    "n",
    "<M-Left>",
    "<C-w>5>",
    { noremap = false, silent = true, desc = "Increase width on the right" }
)
vim.api.nvim_set_keymap("n", "<M-Up>", "<C-w>+", { noremap = false, silent = true, desc = "Increase window height" })
vim.api.nvim_set_keymap("n", "<M-Down>", "<C-w>-", { noremap = false, silent = true, desc = "Decrease window height" })

-- Substitute (mentally named replace, hence the r)
vim.api.nvim_set_keymap(
    "n",
    "<leader>r",
    "<cmd>lua require('substitute').operator()<CR>",
    { noremap = true, silent = true, desc = "Replace" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>rr",
    "<cmd>lua require('substitute').line()<CR>",
    { noremap = true, silent = true, desc = "Replace line" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>R",
    "<cmd>lua require('substitute').eol()<CR>",
    { noremap = true, silent = true, desc = "Replace EOL" }
)
vim.api.nvim_set_keymap(
    "x",
    "<leader>r",
    "<cmd>lua require('substitute').visual()<CR>",
    { noremap = true, silent = true, desc = "Replace" }
)

-- Substitute exchange
vim.api.nvim_set_keymap(
    "n",
    "<leader>rx",
    "<cmd>lua require('substitute.exchange').operator()<CR>",
    { noremap = true, silent = true, desc = "Exchange" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>rxx",
    "<cmd>lua require('substitute.exchange').line()<CR>",
    { noremap = true, silent = true, desc = "Exchange until end of line" }
)
vim.api.nvim_set_keymap(
    "x",
    "<leader>rX",
    "<cmd>lua require('substitute.exchange').visual()<CR>",
    { noremap = true, silent = true, desc = "Exchange" }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>rxc",
    "<cmd>lua require('substitute.exchange').cancel()<CR>",
    { noremap = true, silent = true, desc = "Cancel Exchange" }
)
