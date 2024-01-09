-- Personal plugins
return {
  {
    "marco-souza/ncm.nvim",
    -- dir = "~/workspace/marco-souza/ncm.nvim",
    cmd = "Config",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  {
    "marco-souza/ollero.nvim",
    -- dir = "~/workspace/marco-souza/ollero.nvim",
    event = "VeryLazy",
    config = true,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  {
    "marco-souza/term.nvim",
    event = "VeryLazy",
    dir = "~/workspace/marco-souza/term.nvim",
    opts = {
      shell = "zsh",
      mappings = {
        toggle_terminal = "<leader><leader>",
      },
    },
  },
}
