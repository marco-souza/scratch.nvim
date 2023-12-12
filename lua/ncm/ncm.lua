local M = {}

local split = require("lua.shared.utils").split
local main_path = vim.fn.stdpath("config")
local base_path = vim.fn.resolve(main_path .. "/..")
local prev_path = vim.fn.resolve(main_path .. "/nvim-prev")

---apply nvim config
---@param config_path string
local function apply_config(config_path)
  vim.notify("applying: " .. config_path)

  if not vim.loop.fs_stat(config_path) then
    vim.notify(config_path .. " not found 🥲")
    return
  end

  if vim.loop.fs_stat(main_path) then
    vim.fn.system({
      "rm",
      "-rf",
      main_path,
    })
  end

  if not vim.loop.fs_symlink(config_path, main_path) then
    return vim.notify("failed to link new dir 🥲")
  end

  vim.notify("new config applied! 🎉\nPlease reboot vim!")
  -- require("plenary.reload").reload_module(main_path .. "/init.lua", false)
end

---create a new nvim config
--
-- ex: create_config("default", "marco-souza/scratch.nvim")
--
---@param name string
---@param repo string
local function create_config(name, repo)
  -- TODO: make this dynamic
  repo = "https://github.com/" .. repo .. ".git"

  -- install config
  local config_path = base_path .. name .. ".nvim"
  if not vim.loop.fs_stat(config_path) then
    vim.fn.system({
      "git",
      "clone",
      repo,
      config_path,
    })
  end

  vim.notify(name .. " config created!")
end

local function select_config(name)
  if name ~= nil then
    local config_path = base_path .. "/" .. name
    vim.notify("config path: " .. config_path)
    return apply_config(config_path)
  end

  local options = {}
  local all_files = vim.fn.system({
    "ls",
    base_path,
  })

  for _, val in ipairs(split(all_files)) do
    if string.match(val, ".nvim") then
      table.insert(options, val)
    end
  end

  local function on_select(selected_config)
    local config_path = base_path .. "/" .. selected_config
    vim.notify("selected config path: " .. config_path)
    return apply_config(config_path)
  end

  vim.ui.select(options, { prompt = "Select a config to load" }, on_select)
end

function M.config_command(opts)
  local args = split(opts.args or "", "%S")
  local name, repo = table.unpack(args)

  if repo == nil then
    return select_config(name)
  end

  return create_config(name, repo)
end

return M
