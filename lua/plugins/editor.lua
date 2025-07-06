return {
  -- init
  {
    "rose-pine/neovim",
    init = function()
      --- run colorschema command
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("lualine").setup({
        sections = {
          lualine_x = {
            { require("mcphub.extensions.lualine") },
          },
        },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = true,

      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },

      -- Configuration for the floating window in oil.open_float
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        preview_split = "auto",
        win_options = {
          winblend = 0,
        },
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  },

  -- very lazy
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  { "lewis6991/gitsigns.nvim", event = "VeryLazy" },

  -- lsp attach
  {
    "windwp/nvim-autopairs",
    event = "LspAttach",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "LspAttach",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "LspAttach",
    config = true,
  },
  {
    "wakatime/vim-wakatime",
    event = "LspAttach",
  },
}
