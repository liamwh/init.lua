local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer"
      }
    }
  },
 {
  "neovim/nvim-lspconfig",
  config = function ()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end,
},
{
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = { tools = { inlay_hints = { auto = false } } },
},
{
    "mbbill/undotree"
},
    {
        "tpope/vim-fugitive"
    },
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
    ensure_installed = {
      "vim",
      "lua",
      "html",
      "css",
      "javascript",
      "typescript",
      "json",
      "rust",
      "go"
    },
  },
},
{
    "mfussenegger/nvim-dap"
},
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
        local M = require("plugins.configs.cmp")
        table.insert(M.sources, {name = "crates"})
        return M
    end,
  },
}
return plugins
