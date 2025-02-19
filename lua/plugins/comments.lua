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

local mappings = {
  { "<leader>/", ":normal gcc<CR>", desc = "Line Comment" },
  -- { "gcc", mode = "n", desc = "Comment toggle current line" },
  -- { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
  -- { "gbc", mode = "n", desc = "Comment toggle current block" },
  -- { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
  -- { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
  -- { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
}

return {
  {
    "numToStr/Comment.nvim",
    event = "LspAttach",
    config = true,
    keys = mappings,
  },
  {
    "folke/todo-comments.nvim",
    event = "LspAttach",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = config,
  },
}
