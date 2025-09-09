return {
  -- init
  {
    "rose-pine/neovim",
    init = function()
      --- run colorschema command
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("lualine").setup({
        sections = {
          lualine_x = {
            {
              function()
                -- Check if MCPHub is loaded
                if not vim.g.loaded_mcphub then
                  return "󰐻 -"
                end

                local count = vim.g.mcphub_servers_count or 0
                local status = vim.g.mcphub_status or "stopped"
                local executing = vim.g.mcphub_executing

                -- Show "-" when stopped
                if status == "stopped" then
                  return "󰐻 -"
                end

                -- Show spinner when executing, starting, or restarting
                if
                  executing
                  or status == "starting"
                  or status == "restarting"
                then
                  local frames = {
                    "⠋",
                    "⠙",
                    "⠹",
                    "⠸",
                    "⠼",
                    "⠴",
                    "⠦",
                    "⠧",
                    "⠇",
                    "⠏",
                  }
                  local frame = math.floor(vim.loop.now() / 100) % #frames + 1
                  return "󰐻 " .. frames[frame]
                end

                return "󰐻 " .. count
              end,
              color = function()
                if not vim.g.loaded_mcphub then
                  return { fg = "#6c7086" } -- Gray for not loaded
                end

                local status = vim.g.mcphub_status or "stopped"
                if status == "ready" or status == "restarted" then
                  return { fg = "#50fa7b" } -- Green for connected
                elseif status == "starting" or status == "restarting" then
                  return { fg = "#ffb86c" } -- Orange for connecting
                else
                  return { fg = "#ff5555" } -- Red for error/stopped
                end
              end,
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer = true,

      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },

      -- Configuration for the floating window in oil.open_float
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        preview_split = "auto",
        win_options = {
          winblend = 0,
        },
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  },

  -- very lazy
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  { "lewis6991/gitsigns.nvim", event = "VeryLazy" },

  -- lsp attach
  {
    "windwp/nvim-autopairs",
    event = "LspAttach",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "LspAttach",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "LspAttach",
    config = true,
  },
  {
    "wakatime/vim-wakatime",
    event = "LspAttach",
  },
}
