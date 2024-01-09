return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      --- run colorschema command
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "folke/which-key.nvim",
    config = true,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
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
    event = "InsertEnter",
  },
  {
    "wakatime/vim-wakatime",
    event = "InsertEnter",
  },
}
