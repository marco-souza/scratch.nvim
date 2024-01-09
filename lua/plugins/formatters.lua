return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local b = null_ls.builtins

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
      })

      vim.keymap.set(
        "n",
        "<leader>gf",
        vim.lsp.buf.format,
        { desc = "Format buffer" }
      )
    end,
  },
}
