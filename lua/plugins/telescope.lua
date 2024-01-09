return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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
  },
}
