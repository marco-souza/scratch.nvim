return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local b = null_ls.builtins
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        sources = {
          -- lua
          b.formatting.stylua,
          b.diagnostics.luacheck,

          -- webdev
          b.formatting.eslint_d, -- so prettier works only on these filetypes
          b.formatting.prettier,

          -- rust
          b.formatting.rustfmt,

          -- go
          b.formatting.gofumpt,
          b.formatting.goimports_reviser,
          b.formatting.golines,

          -- other stuff
          b.diagnostics.todo_comments,
          b.diagnostics.trail_space,
          b.code_actions.refactoring,
        },
        on_attach = function(client, bufnr)
          -- format on save
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })

      vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "Format buffer" })
    end,
  },
}
