local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins",
        },

        -- languages
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.rust" },
        { import = "lazyvim.plugins.extras.lang.tailwind" },
        { import = "lazyvim.plugins.extras.lang.go" },
        { import = "lazyvim.plugins.extras.lang.markdown" },
        { import = "lazyvim.plugins.extras.lang.toml" },
        -- { import = "lazyvim.plugins.extras.lang.nix" },
        { import = "lazyvim.plugins.extras.lang.gleam" },
        -- { import = "lazyvim.plugins.extras.lang.nushell" },
        { import = "lazyvim.plugins.extras.lang.sql" },
        -- { import = "lazyvim.plugins.extras.lang.elixir" },
        { import = "lazyvim.plugins.extras.lang.astro" },
        { import = "lazyvim.plugins.extras.lang.svelte" },
        { import = "lazyvim.plugins.extras.lang.git" },
        { import = "lazyvim.plugins.extras.lang.omnisharp" },
        { import = "lazyvim.plugins.extras.lang.python" },
        { import = "lazyvim.plugins.extras.lang.ansible" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lang.terraform" },
        { import = "lazyvim.plugins.extras.lang.yaml" },
        { import = "lazyvim.plugins.extras.lang.tex" },
        { import = "lazyvim.plugins.extras.lang.helm" },
        -- { import = "lazyvim.plugins.extras.lang.haskell" },
        -- { import = "lazyvim.plugins.extras.lang.clojure" },
        -- { import = "lazyvim.plugins.extras.lang.php" },
        -- { import = "lazyvim.plugins.extras.lang.ruby" },
        -- linting/formatting
        { import = "lazyvim.plugins.extras.linting.eslint" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        -- ui
        { import = "lazyvim.plugins.extras.ui.treesitter-context" },
        { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
        -- { import = "lazyvim.plugins.extras.ui.edgy" },
        -- coding
        -- { import = "lazyvim.plugins.extras.coding.copilot" },
        -- { import = "lazyvim.plugins.extras.coding.copilot-chat" },
        { import = "lazyvim.plugins.extras.coding.yanky" },
        { import = "lazyvim.plugins.extras.coding.mini-surround" },
        -- dap
        { import = "lazyvim.plugins.extras.dap.core" },
        -- editor
        { import = "lazyvim.plugins.extras.editor.dial" },
        { import = "lazyvim.plugins.extras.editor.fzf" },
        -- { import = "lazyvim.plugins.extras.editor.telescope" },
        { import = "lazyvim.plugins.extras.editor.mini-files" },
        { import = "lazyvim.plugins.extras.editor.mini-diff" },
        { import = "lazyvim.plugins.extras.editor.mini-move" },
        { import = "lazyvim.plugins.extras.editor.illuminate" },
        { import = "lazyvim.plugins.extras.editor.inc-rename" },
        { import = "lazyvim.plugins.extras.editor.leap" },
        { import = "lazyvim.plugins.extras.editor.aerial" },
        -- { import = "lazyvim.plugins.extras.editor.outline" },
        -- other
        { import = "lazyvim.plugins.extras.vscode" },
        { import = "lazyvim.plugins.extras.test.core" },
        -- utils
        -- { import = "lazyvim.plugins.extras.util.gitui" },
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
        { import = "lazyvim.plugins.extras.util.project" },
        { import = "lazyvim.plugins.extras.util.dot" },
        { import = "lazyvim.plugins.extras.util.octo" },
        { import = "lazyvim.plugins.extras.util.startuptime" },

        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    news = {
        -- When enabled, NEWS.md will be shown when changed.
        -- This only contains big new features and breaking changes.
        lazyvim = true,
        -- Same but for Neovim's news.txt
        neovim = true,
    },
    install = { colorscheme = { "tokyonight", "habamax", "dracula" } },
    checker = {
        enabled = true, -- automatically check for plugin updates
        notify = false, -- don't notify about updates on startup
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
