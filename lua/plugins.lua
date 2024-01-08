-- Plugin module
local M = {}

local configs = {
  treesitter = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- recommended
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
      },
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ss",
          node_incremental = "<leader>si",
          scope_incremental = "<leader>sc",
          node_decremental= "<leader>sd",
        },
      },
    })
  end,
  theme = function()
    --- run colorschema command
    vim.cmd.colorscheme("kanagawa-wave")
  end,
}

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    config = configs.treesitter,
  },
  {
    "rebelot/kanagawa.nvim",
    config = configs.theme,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ff",
        function(opts)
          require("telescope.builtin").find_files(opts)
        end,
        desc = "Find files",
      },
      {
        "<leader>fw",
        function(opts)
          require("telescope.builtin").live_grep(opts)
        end,
        desc = "Find Word",
      },
      {
        "<leader>fb",
        function(opts)
          require("telescope.builtin").buffers(opts)
        end,
        desc = "Find in buffer",
      },
      {
        "<leader>fh",
        function(opts)
          require("telescope.builtin").help_tags(opts)
        end,
        desc = "Find help",
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ml",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "list marks",
      },
      {
        "<leader>mt",
        function()
          require("harpoon.term").gotoTerminal()
        end,
        desc = "term",
      },
      {
        "<leader>mm",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Show marks",
      },
      {
        "<leader>mn",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Next mark",
      },
      {
        "<leader>mb",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Prev mark",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      {
        "<leader><leader>",
        function()
          vim.cmd("Neotree toggle")
        end,
        desc = "Neotree toggle",
      },
    },
  },
  {
    "NeogitOrg/neogit",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    keys = {
      {
        "<leader>gg",
        function()
          vim.cmd("Neogit")
        end,
        desc = "Neogit toggle",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "nvim-neorg/neorg",
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
              neorg_leader = " ",
              default_keybinds = true,
            },
          },
        },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = {
      { "<leader>c", ":normal gcc<CR>", desc = "Line Comment" },
      { "<leader>b", ":normal gbc<CR>", desc = "Block Comment" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
  },
  { "airblade/vim-gitgutter" },
  { "wakatime/vim-wakatime" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- Personal plugins
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

local function setup_lazy(opts)
  opts = opts
    or {
      change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = true, -- get a notification when changes are found
      },
    }

  -- install lazy
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- startup lazy
  require("lazy").setup(plugins, opts)
end

function M.setup()
  print("loading plugins")
  setup_lazy()

  if vim.fn.expand("%") == "" then
    vim.cmd("intro")
  end
end

return M
