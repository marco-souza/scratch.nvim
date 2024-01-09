-- Personal plugins
return {
  {
    "marco-souza/ncm.nvim",
    -- dir = "~/workspace/marco-souza/ncm.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  {
    "marco-souza/ollero.nvim",
    -- dir = "~/workspace/marco-souza/ollero.nvim",
    config = true,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  {
    "marco-souza/term.nvim",
    opts = { shell = "zsh" },
  },
}

