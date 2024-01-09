local config = {
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = {
      icon = "⏲ ",
      color = "test",
      alt = { "TESTING", "PASSED", "FAILED" },
    },
  },
}

return {
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = {
      { "<leader>/", ":normal gcc<CR>", desc = "Line Comment" },
      { "<leader>?", ":normal gbc<CR>", desc = "Block Comment" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = config,
  },
}
