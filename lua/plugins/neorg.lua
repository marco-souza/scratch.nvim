return {
  {
    "nvim-neorg/neorg",
    ft = "norg", -- load only for this filetype
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/workspace/marco-souza/notes",
                default = "~/workspace/marco-souza/notes",
              },
            },
          },
          ["core.keybinds"] = {
            config = {
              neorg_leader = "\\",
              default_keybinds = true,
            },
          },
        },
      })
    end,
  },
}
