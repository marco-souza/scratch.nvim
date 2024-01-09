return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      --- run colorschema command
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  "airblade/vim-gitgutter",
  "wakatime/vim-wakatime",
}
