return {
  {
    "saghen/blink.cmp",
    event = "LspAttach",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            {
              path = "${3rd}/luv/library",
              words = { "vim%.uv" },
            },
          },
        },
      },

      -- add blink.compat
      {
        "saghen/blink.compat",
        -- use v2.* for blink.cmp v1.*
        version = "2.*",
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- reference https://cmp.saghen.dev/configuration/keymap.html#keymap
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-e>"] = { "hide" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = { auto_show = true },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },

      sources = {
        default = {
          -- lsp
          "lsp",
          "lazydev",
          "path",

          -- avante
          "avante_commands",
          "avante_files",
          "avante_mentions",

          -- snippets
          "copilot",
          "snippets",

          -- buffer
          "buffer",
        },

        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            async = true,
          },

          lazydev = {
            name = "lazydev",
            module = "lazydev.integrations.blink",
          },

          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_files = {
            name = "avante_files",
            module = "blink.compat.source",
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
