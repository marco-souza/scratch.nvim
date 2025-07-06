return {
  {
    dir = "~/w/marco-souza/present.nvim/",
    cmd = "Present",
    config = true,
  },
  {
    "marco-souza/rest.nvim",
    dir = "~/w/marco-souza/rest.nvim/",
    cmd = "Rest",
    config = true,
    keys = {
      {
        "<leader>r",
        ":Rest open<CR>",
        desc = "Open Rest Client",
      },
    },
  },
  {
    "marco-souza/ollero.nvim",
    event = "VeryLazy",
    opts = {},
    dir = "~/w/marco-souza/ollero.nvim/",
    -- build = ":!go install github.com/marco-souza/omg@latest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "marco-souza/term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
}
