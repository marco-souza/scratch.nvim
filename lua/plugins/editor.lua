return {
  {
    "rebelot/kanagawa.nvim",
    init = function()
      --- run colorschema command
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("lualine").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    config = true,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "airblade/vim-gitgutter",
    event = "LspAttach",
  },
  {
    "wakatime/vim-wakatime",
    event = "LspAttach",
  },
}
