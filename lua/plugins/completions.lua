return {
  {
    "saghen/blink.cmp",
    event = "LspAttach",
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
    },
    version = "1.*",

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
      sources = {
        default = { "copilot", "lazydev", "lsp", "snippets", "path", "buffer" },
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
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          -- sort emmet after lsp results -- ref https://github.com/Saghen/blink.cmp/issues/1162
          function(a, b)
            if a.source_name ~= "LSP" or b.source_name ~= "LSP" then
              return
            end
            local name = vim.lsp.get_client_by_id(b.client_id).name
            return name == "emmet_language_server"
          end,
          "score",
          "sort_text",
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
