return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ml",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "list marks",
      },
      {
        "<leader>mt",
        function()
          require("harpoon.term").gotoTerminal()
        end,
        desc = "term",
      },
      {
        "<leader>mm",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Show marks",
      },
      {
        "<leader>mn",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Next mark",
      },
      {
        "<leader>mb",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Prev mark",
      },
    },
  },
}
