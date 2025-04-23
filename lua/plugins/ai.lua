return {
  -- setup ollero
  {
    "marco-souza/ollero.nvim",
    event = "VeryLazy",
    opts = { model = "deepseek-r1:8b" },
    -- dir = "~/w/marco-souza/ollero.nvim/",
    dependencies = {
      "marco-souza/term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },

  -- avante.nvim (nvim cursor-like)
  {
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      version = false, -- set this if you want to always pull the latest change
      opts = {
        provider = "copilot",
        behaviour = {
          enable_cursor_planning_mode = true, -- enable cursor planning mode!
        },
        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          return hub:get_active_servers_prompt()
        end,
        custom_tools = function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end,
      },
      build = "make",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        {
          "zbirenbaum/copilot.lua",    -- for providers='copilot'
          event = "VeryLazy",
          config = true,
          opts = { enable = true },
        },
        {
          "zbirenbaum/copilot-cmp",
          event = "VeryLazy",
          config = true,
        },
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          "MeanderingProgrammer/render-markdown.nvim",
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
  },

  -- mcp.nvim (extend llm funcitonality with tools)
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- comment the following line to ensure hub will be ready at the earliest
    cmd = "MCPHub",                          -- lazy load by default
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
    -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    opts = {
      auto_approve = true,
    },
  },
}
