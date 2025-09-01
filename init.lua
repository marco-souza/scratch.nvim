---@alias NeovimDistro "mini" | "kickstart" | "default"

---@type NeovimDistro
local version = os.getenv("DISTRO") or "mini"

print("distro: " .. version)

if version == "mini" then
  return require("mini")
end

if version == "kickstart" then
  return require("repos.kickstart.nvim")
end

-- nvim startup
require("options")
require("mappings")
require("mappings")

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
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = { lazy = true },
})

-- INFO: switch to minimal Setup
-- require("mini")
