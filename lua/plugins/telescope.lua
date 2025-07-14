return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    keys = {
      {
        "<leader>ff",
        function(opts)
          require("telescope.builtin").find_files(opts)
        end,
        desc = "Find files",
      },
      {
        "<leader>fw",
        function(opts)
          require("telescope.builtin").live_grep(opts)
        end,
        desc = "Find Word",
      },
      {
        "<leader>fb",
        function(opts)
          require("telescope.builtin").buffers(opts)
        end,
        desc = "Find in buffer",
      },
      {
        "<leader>fh",
        function(opts)
          require("telescope.builtin").help_tags(opts)
        end,
        desc = "Find help",
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/",
            "%.git/",
            "%.lock",
          },
        },

        pickers = {
          find_files = {
            hidden = true,
          },
          grep_string = {
            additional_args = { "--hidden" },
          },
          live_grep = {
            additional_args = { "--hidden" },
          },
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
