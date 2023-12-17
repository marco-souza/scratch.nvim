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
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "marco-souza/ncm.nvim",
    -- dir = "~/workspace/marco-souza/ncm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    opts = {},
  },
  {
    "TimUntersberger/neogit",
    opts = {},
  },
}

local function setup_lazy(opts)
  opts = opts or {
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
end

return M
