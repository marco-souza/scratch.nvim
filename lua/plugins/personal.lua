return {
  {
    dir = "~/w/marco-souza/present.nvim/",
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
