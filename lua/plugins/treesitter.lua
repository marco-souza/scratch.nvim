local ensure_installed = {
  -- recommended
  "query",
  "markdown",
  "markdown_inline",

  -- web dev
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "json",

  -- backend
  "python",
  "lua",
  "go",

  -- low level
  "c",
  "zig",
  "rust",
}

local textobjects = {
  select = {
    enable = true,

    lookahead = true,

    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = {
        query = "@class.inner",
        desc = "Select inner part of a class region",
      },
      ["as"] = {
        query = "@scope",
        query_group = "locals",
        desc = "Select language scope",
      },
    },
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = true,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  init = function()
    require("nvim-treesitter.configs").setup({
      textobjects = textobjects,
      ensure_installed = ensure_installed,
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental = "<leader>sd",
        },
      },
    })
  end,
}
