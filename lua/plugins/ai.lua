return {

  -- avante.nvim (nvim cursor-like)
  {
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      version = false, -- set this if you want to always pull the latest change
      opts = {
        provider = "copilot",
        cursor_applying_provider = "groq",
        behaviour = {
          enable_cursor_planning_mode = true, -- enable cursor planning mode!
        },

        providers = {
          groq = { -- define groq provider
            __inherited_from = "openai",
            api_key_name = "GROQ_API_KEY",
            endpoint = "https://api.groq.com/openai/v1/",
            model = "llama-3.3-70b-versatile",
            extra_request_body = {
              max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
            },
          },
        },

        system_prompt = function()
          local hub = require("mcphub").get_hub_instance()
          if hub then
            return hub:get_active_servers_prompt()
          end
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
          "zbirenbaum/copilot.lua", -- for providers='copilot'
          cmd = "Copilot",
          event = "LspAttach",
          opts = {
            suggestion = { enabled = true },
            panel = { enabled = true },
            filetypes = {
              markdown = true,
              help = true,
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
    cmd = "MCPHub", -- lazy load by default
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    ---@module 'mcphub'
    ---@type MCPHub.Config
    opts = {
      --- reference https://github.com/ravitemer/mcphub.nvim?tab=readme-ov-file#advanced-configuration
      port = 37373, -- Default port for MCP Hub
      config = vim.fn.expand("~/.config/nvim/.mcphub/servers.json"), -- Absolute path to config file location (will create if not exists)
      auto_approve = true,
      auto_toggle_mcp_servers = true,
      native_servers = {},
      shutdown_delay = 600000, -- Delay in ms before shutting down the server when last instance closes (default: 10 minutes)
      use_bundled_binary = false, -- Uses bundled mcp-hub script instead of global installation

      extensions = {
        avante = {
          make_slash_commands = true, -- make /slash commands from MCP server prompts
        },
      },

      -- Default window settings
      ui = {
        window = {
          width = 0.8, -- 0-1 (ratio); "50%" (percentage); 50 (raw number)
          height = 0.8, -- 0-1 (ratio); "50%" (percentage); 50 (raw number)
          relative = "editor",
          zindex = 50,
          border = "rounded", -- "none", "single", "double", "rounded", "solid", "shadow"
        },
        wo = { -- window-scoped options (vim.wo)
        },
      },

      -- Event callbacks
      on_ready = function(hub)
        -- Called when hub is ready
      end,
      on_error = function(err)
        -- Called on errors
      end,

      -- Logging configuration
      log = {
        level = vim.log.levels.WARN,
        to_file = false,
        file_path = nil,
        prefix = "MCPHub",
      },
    },
  },
}
