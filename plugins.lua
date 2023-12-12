-- Plugin module
local M = {}

local plugins = {
  { "rebelot/kanagawa.nvim" }
}

local function setup_lazy(opts)
  opts = opts or {}

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

function M.setup(opts)
  print("loading plugins")
  setup_lazy()
end

return M
