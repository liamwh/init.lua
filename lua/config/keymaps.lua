-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Helpers
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ──────────────────────────────────────────────────────────────────────────────
-- General (applies to Neovim everywhere, including VS Code unless guarded)
-- ──────────────────────────────────────────────────────────────────────────────

-- Move selected lines up/down
map("x", "<Up>", ":move '<-2<CR>gv-gv", opts)
map("x", "<Down>", ":move '>+1<CR>gv-gv", opts)

-- Delete to blackhole by default
map("n", "d",  '"_d',  opts)
map("n", "dd", '"_dd', opts)
map("n", "di", '"_di', opts)

-- Terminal splits
map("n", "<leader>th", ":split | terminal<CR>i", { noremap = true, silent = true, desc = "Open terminal (horizontal)" })
map("n", "<leader>tv", ":vsplit | terminal<CR>i", { noremap = true, silent = true, desc = "Open terminal (vertical)" })

-- Resize windows with Alt+Arrows
map("n", "<M-Right>", "<C-w>5<", { noremap = false, silent = true, desc = "Decrease width (left)" })
map("n", "<M-Left>",  "<C-w>5>", { noremap = false, silent = true, desc = "Increase width (right)" })
map("n", "<M-Up>",    "<C-w>+",  { noremap = false, silent = true, desc = "Increase height" })
map("n", "<M-Down>",  "<C-w>-",  { noremap = false, silent = true, desc = "Decrease height" })

-- Go to Type Definition (LSP)
map("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

-- Save with ⌘S
map("n", "<D-s>", ":w<CR>", opts)

-- ──────────────────────────────────────────────────────────────────────────────
-- Substitute / Substitute Exchange (native Neovim only; avoid in VS Code)
-- ──────────────────────────────────────────────────────────────────────────────
if not vim.g.vscode then
  local ok_sub, substitute = pcall(require, "substitute")
  if ok_sub then
    map("n", "<leader>r",  substitute.operator, { noremap = true, silent = true, desc = "Replace (operator)" })
    map("n", "<leader>rr", substitute.line,     { noremap = true, silent = true, desc = "Replace line" })
    map("n", "<leader>R",  substitute.eol,      { noremap = true, silent = true, desc = "Replace to EOL" })
    map("x", "<leader>r",  substitute.visual,   { noremap = true, silent = true, desc = "Replace (visual)" })
  end

  local ok_ex, exchange = pcall(require, "substitute.exchange")
  if ok_ex then
    map("n", "<leader>rx",  exchange.operator, { noremap = true, silent = true, desc = "Exchange (operator)" })
    map("n", "<leader>rxx", exchange.line,     { noremap = true, silent = true, desc = "Exchange line" })
    map("x", "<leader>rX",  exchange.visual,   { noremap = true, silent = true, desc = "Exchange (visual)" })
    map("n", "<leader>rxc", exchange.cancel,   { noremap = true, silent = true, desc = "Exchange cancel" })
  end
end

-- ──────────────────────────────────────────────────────────────────────────────
-- VS Code specific mappings (vscode-neovim)
-- ──────────────────────────────────────────────────────────────────────────────
if vim.g.vscode then
  -- Multi-cursor: add selection to next match (like VS Code Ctrl+D); safe if plugin missing
  do
    local ok_vmc, vmc = pcall(require, "vscode-multi-cursor")
    if ok_vmc then
      map({ "n", "x", "i" }, "<C-d>", function() vmc.addSelectionToNextFindMatch() end, { silent = true })
    end
  end

  -- Make Space a pure leader in VS Code; ensure sequences resolve reliably
  vim.g.mapleader = " "
  map({ "n", "x", "o" }, "<Space>", "<Nop>", { silent = true })

  -- Mapping timeouts (leader combos) & keycode timeout (post-ESC)
  vim.o.timeout = true
  vim.o.timeoutlen = 400          -- adjust 400–800 to taste
  vim.o.ttimeout = true
  vim.o.ttimeoutlen = 10          -- tiny to avoid missing first key after leaving insert mode

  -- Helper to call VS Code commands
  local function cmd(c) return function() vim.fn.VSCodeNotify(c) end end

  -- Files / switching
  map("n", "<leader>,",            cmd("workbench.action.showAllEditors"),                             { desc = "Show all editors", unpack(opts) })
  map("n", "<leader><leader>",     function() vim.fn.VSCodeNotify("workbench.action.quickOpen") end,  { noremap = true, silent = true, nowait = true, desc = "Quick Open (files)" })
  map("n", "<leader>ff",           cmd("workbench.action.quickOpen"),                                  { desc = "Quick Open (files)", unpack(opts) })
  map("n", "<leader>bb",           cmd("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup"), { desc = "Previous editor in group", unpack(opts) })

  -- Search / navigation
  map("n", "<leader>/",            cmd("workbench.action.findInFiles"),                                { desc = "Find in files", unpack(opts) })
  map("n", "<leader>ss",           cmd("workbench.action.showAllSymbols"),                             { desc = "Search symbols", unpack(opts) })

  -- Window management
  map("n", "<leader>bd",           cmd("workbench.action.closeActiveEditor"),                          { desc = "Close editor", unpack(opts) })
  map("n", "<leader>v",            cmd("workbench.action.splitEditorRight"),                           { desc = "Split right", unpack(opts) })
  map("n", "<leader>h",            cmd("workbench.action.splitEditorDown"),                            { desc = "Split down", unpack(opts) })
  map("n", "<leader>-",            cmd("workbench.action.splitEditorDown"),                            { desc = "Split down", unpack(opts) })
  map("n", "<leader>wd",           cmd("workbench.action.closeEditorsInGroup"),                        { desc = "Close editors in group", unpack(opts) })

  -- Explorer / sidebars
  map("n", "<leader>e",            cmd("workbench.view.explorer"),                                     { desc = "Explorer", unpack(opts) })
  map("n", "<leader>fm",           cmd("workbench.view.explorer"),                                     { desc = "Explorer", unpack(opts) })
  map("n", "<leader>tt",           cmd("workbench.action.toggleSidebarVisibility"),                    { desc = "Toggle primary sidebar", unpack(opts) })

  -- Code actions / refs / rename
  map("n", "<leader>ca",           cmd("editor.action.quickFix"),                                      { desc = "Quick Fix", unpack(opts) })
  map("n", "<leader>cr",           cmd("editor.action.rename"),                                        { desc = "Rename symbol", unpack(opts) })
  map("n", "<leader>gr",           cmd("editor.action.referenceSearch.trigger"),                       { desc = "Find references", unpack(opts) })

  -- Testing
  map("n", "<leader>ts",           cmd("workbench.view.testing.focus"),                                { desc = "Testing focus", unpack(opts) })

  -- Markdown
  map("n", "<leader>mp",           cmd("markdown.showPreviewToSide"),                                  { desc = "Markdown preview (side)", unpack(opts) })

  -- Outline / timeline
  map("n", "<leader>so",           cmd("outline.focus"),                                               { desc = "Outline focus", unpack(opts) })
  map("n", "<leader>u",            cmd("timeline.focus"),                                              { desc = "Timeline focus", unpack(opts) })
  map("n", "<leader>fh",           cmd("timeline.focus"),                                              { desc = "Timeline focus", unpack(opts) })

  -- Find/replace
  map("n", "<leader>sr",           cmd("editor.action.startFindReplaceAction"),                        { desc = "Find & Replace", unpack(opts) })

  -- Git / GitLens / LazyGit (VS Code extension handles UI hide/restore)
  map("n", "<leader>gg",           cmd("lazygit-vscode.toggle"),                                       { desc = "LazyGit toggle", unpack(opts) })
  map("n", "<leader>gbl",          cmd("gitlens.toggleLineBlame"),                                     { desc = "GitLens line blame", unpack(opts) })
  map("n", "<leader>gbf",          cmd("gitlens.toggleFileBlame"),                                     { desc = "GitLens file blame", unpack(opts) })
  map("n", "<leader>gh",           cmd("workbench.scm.history.focus"),                                 { desc = "SCM history", unpack(opts) })

  -- Problems / diagnostics navigation
  map("n", "<leader>pn",           cmd("editor.action.marker.next"),                                   { desc = "Next problem", unpack(opts) })
  map("n", "<leader>pN",           cmd("editor.action.marker.nextInFiles"),                            { desc = "Next problem (in files)", unpack(opts) })
  map("n", "<leader>pp",           cmd("editor.action.marker.prev"),                                   { desc = "Prev problem", unpack(opts) })
  map("n", "<leader>pP",           cmd("editor.action.marker.prevInFiles"),                            { desc = "Prev problem (in files)", unpack(opts) })
  map("n", "<leader>pe",           cmd("next-error.next.error"),                                       { desc = "Next error only", unpack(opts) })
  map("n", "<leader>pE",           cmd("next-error.nextInFiles.error"),                                { desc = "Next error only (in files)", unpack(opts) })
  map("n", "<leader>pw",           cmd("next-error.next.warning"),                                     { desc = "Next warning/error", unpack(opts) })
  map("n", "<leader>pW",           cmd("next-error.nextInFiles.warning"),                              { desc = "Next warning/error (in files)", unpack(opts) })
end