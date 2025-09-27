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
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })


if not not vim.g.vscode then
    vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
        require("vscode-multi-cursor").addSelectionToNextFindMatch()
    end)
end


-- Save with ⌘ + S
vim.api.nvim_set_keymap('n', '<D-s>', ':w<CR>', { noremap = true, silent = true })

----------------------------
-- VS Code + Neovim: re-create VS Code "space ..." chords inside Neovim
-- This prevents VS Code's chord engine from ever engaging in chat inputs.
if not vim.g.vscode then return end

vim.g.mapleader = " "
local map = vim.keymap.set
local function cmd(c) return function() vim.fn.VSCodeNotify(c) end end
local opts = { noremap = true, silent = true }

-- Files / switching
map('n', '<leader>,',           cmd('workbench.action.showAllEditors'), opts)
map('n', '<leader><leader>',    cmd('workbench.action.quickOpen'),      opts)
map('n', '<leader>bb',          cmd('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup'), opts)

-- Search / navigation
map('n', '<leader>/',           cmd('workbench.action.findInFiles'),    opts)
map('n', '<leader>ss',          cmd('workbench.action.showAllSymbols'), opts)

-- Window management
map('n', '<leader>bd',          cmd('workbench.action.closeActiveEditor'), opts)
map('n', '<leader>v',           cmd('workbench.action.splitEditorRight'),  opts)
map('n', '<leader>h',           cmd('workbench.action.splitEditorDown'),   opts)
map('n', '<leader>-',           cmd('workbench.action.splitEditorDown'),   opts)
map('n', '<leader>wd',          cmd('workbench.action.closeEditorsInGroup'), opts)

-- Explorer / sidebars
map('n', '<leader>e',           cmd('workbench.view.explorer'),         opts)
map('n', '<leader>fm',          cmd('workbench.view.explorer'),         opts)
map('n', '<leader>tt',          cmd('workbench.action.toggleSidebarVisibility'), opts)

-- Code actions / refs / rename
map('n', '<leader>ca',          cmd('editor.action.quickFix'),          opts)
map('n', '<leader>cr',          cmd('editor.action.rename'),            opts)
map('n', '<leader>gr',          cmd('editor.action.referenceSearch.trigger'), opts)

-- Testing
map('n', '<leader>ts',          cmd('workbench.view.testing.focus'),    opts)

-- Markdown
map('n', '<leader>mp',          cmd('markdown.showPreviewToSide'),      opts)

-- Outline / timeline
map('n', '<leader>so',          cmd('outline.focus'),                   opts)
map('n', '<leader>u',           cmd('timeline.focus'),                  opts)
map('n', '<leader>fh',          cmd('timeline.focus'),                  opts)

-- Find/replace
map('n', '<leader>sr',          cmd('editor.action.startFindReplaceAction'), opts)

-- Git / GitLens / Lazygit wrapper
map('n', '<leader>gg',          cmd('extension.multiCommand.closeSidebarAndOpenLazyGit'), opts)
map('n', '<leader>gbl',         cmd('gitlens.toggleLineBlame'),         opts)
map('n', '<leader>gbf',         cmd('gitlens.toggleFileBlame'),         opts)
map('n', '<leader>gh',          cmd('workbench.scm.history.focus'),     opts)

-- Problems / diagnostics navigation
map('n', '<leader>pn',          cmd('editor.action.marker.next'),       opts)
map('n', '<leader>pN',          cmd('editor.action.marker.nextInFiles'),opts)
map('n', '<leader>pp',          cmd('editor.action.marker.prev'),       opts)
map('n', '<leader>pP',          cmd('editor.action.marker.prevInFiles'),opts)
map('n', '<leader>pe',          cmd('next-error.next.error'),           opts)
map('n', '<leader>pE',          cmd('next-error.nextInFiles.error'),    opts)
map('n', '<leader>pw',          cmd('next-error.next.warning'),         opts)
map('n', '<leader>pW',          cmd('next-error.nextInFiles.warning'),  opts)