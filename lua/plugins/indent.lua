return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    depends = { "nvim-treesitter/nvim-treesitter" },
    event = "LspAttach",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
