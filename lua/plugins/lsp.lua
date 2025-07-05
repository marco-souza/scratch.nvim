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
          ensure_installed = lsp.list_servers(),
        },
      },
    },
  },

  -- Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        elixirls = {
          enable = true,
          settings = elixirls.settings({
            dialyzerEnabled = true,
            enableTestLenses = false,
            fetchDeps = true,
            suggestSpecs = true,
          }),
          on_attach = function(client, bufnr)
            vim.keymap.set(
              "n",
              "<space>fp",
              ":ElixirFromPipe<cr>",
              { buffer = true, noremap = true }
            )
            vim.keymap.set(
              "n",
              "<space>tp",
              ":ElixirToPipe<cr>",
              { buffer = true, noremap = true }
            )
            vim.keymap.set(
              "v",
              "<space>em",
              ":ElixirExpandMacro<cr>",
              { buffer = true, noremap = true }
            )
          end,
        },
        projectionist = {
          enable = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
