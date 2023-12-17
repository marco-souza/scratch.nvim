P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

if not table.unpack then
  table.unpack = unpack
end

local M = {}

---Split a string into a table
---@param str string
---@param separator string | nil
---@return table
function M.split(str, separator)
  local lines = {}
  local sep = separator or "^\r\n" -- line break

  for s in str:gmatch("[" .. sep .. "]+") do
    table.insert(lines, s)
  end

  return lines
end

return M
