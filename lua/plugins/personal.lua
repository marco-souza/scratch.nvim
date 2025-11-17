return {
  {
    "marco-souza/term.nvim",
    dir = "~/w/marco-souza/term.nvim/",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = "Term",
    config = true,
    keys = {
      {
        "<leader>t",
        ":Term open<CR>",
        desc = "Toggle Term dashboard",
      },
    },
  },
  {
    "marco-souza/present.nvim",
    -- dir = "~/w/marco-souza/present.nvim/",
    cmd = "Present",
    config = true,
  },
  {
    "marco-souza/rest.nvim",
    -- dir = "~/w/marco-souza/rest.nvim/",
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
}
