local lsp = require("config.lsp")

return {
  ---@module 'lazy'
  ---@type LazyConfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = lsp.setup,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          automatic_enable = false,
          ensure_installed = lsp.installed_servers,
        },
      },
    },
  },
}
