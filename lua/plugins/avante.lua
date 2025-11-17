return {
  -- avante.nvim (nvim cursor-like)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      cursor_applying_provider = "copilot",
      hints = { enable = true },

      behaviour = {
        enable_cursor_planning_mode = true, -- enable cursor planning mode!
      },

      -- providers = {
      --   copilot = {
      --     model = "gemini-2.5-pro",
      --   },
      -- },

      rules = {
        project_dir = ".avante/rules", -- relative to project root, can also be an absolute path
      },

      -- MCPHub integration
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
    shortcuts = {
      {
        name = "refactor",
        description = "Refactor code with best practices",
        details = "Automatically refactor code to improve readability, maintainability, and follow best practices while preserving functionality",
        prompt = "Please refactor this code following best practices, improving readability and maintainability while preserving functionality.",
      },
      {
        name = "test",
        description = "Generate unit tests",
        details = "Create comprehensive unit tests covering edge cases, error scenarios, and various input conditions",
        prompt = "Please generate comprehensive unit tests for this code, covering edge cases and error scenarios.",
      },
      {
        name = "setup_avante",
        description = "Setup avante.nvim configuration",
        details = "Helps set up avante.nvim configuration based on the provided buffers",
        prompt = "Please setup avante.nvim for this project. Check if there is a .avante/rules directory in the project, if it doesn't exists, create avanterules based on the link @fetch https://github.com/yetone/avante.nvim/tree/main/lua/avante/templates",
      },
      {
        name = "review",
        description = "Setup avante.nvim configuration",
        details = "Helps set up avante.nvim configuration based on the provided buffers",
        prompt = "Please setup avante.nvim for this project. Check if there is a .avante/rules directory in the project, if it doesn't exists, create avanterules based on the link @fetch https://github.com/yetone/avante.nvim/tree/main/lua/avante/templates",
      },
    },
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

  -- mcp.nvim (extend llm functionality with tools)
  {
    "ravitemer/mcphub.nvim",
    cmd = "MCPHub",
    event = "VeryLazy",
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>am",
        "<cmd>MCPHub toggle<cr>",
        desc = "Toggle MCP Hub ⚒️",
      },
    },
    opts = {
      --- reference https://github.com/ravitemer/mcphub.nvim?tab=readme-ov-file#advanced-configuration
      port = 37373, -- Default port for MCP Hub
      config = vim.fn.expand("~/.config/nvim/.mcphub/servers.json"), -- Absolute path to config file location
      auto_approve = true,
      auto_toggle_mcp_servers = true,
      native_servers = {},
      shutdown_delay = 10 * 60 * 1000, -- Delay in ms before shutting down the server when last instance closes
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
      },

      -- Event callbacks
      on_ready = function(hub)
        -- INFO: Called when hub is ready
      end,
      on_error = function(err)
        -- INFO: Called on errors
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
