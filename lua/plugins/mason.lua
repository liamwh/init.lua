return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            -- Do not install the Azure Pipelines Language Server or you will get error messages upon opening .yaml files.
            "prettierd",
            "biome",
            "codelldb",
            "powershell-editor-services",
            "docker-compose-language-service",
            "markdownlint",
            "marksman",
            "gitui",
            "svelte-language-server",
            "helm-ls",
            "gopls",
            "regols",
            "hadolint",
            "glow",
            "oxlint",
        },
    },
}
