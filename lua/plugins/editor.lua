return {
  {
    "rose-pine/neovim",
    init = function()
      --- run colorschema command
      vim.cmd.colorscheme("rose-pine")
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
    event = "BufWinEnter",
  },
  {
    "wakatime/vim-wakatime",
    event = "LspAttach",
  },
  {
    dir = "~/w/marco-souza/present.nvim/",
    cmd = "Present",
    opts = {},
  },
}
