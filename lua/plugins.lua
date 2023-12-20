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
  { "wakatime/vim-wakatime" },
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
