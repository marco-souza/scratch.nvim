local is = {
  deno = function()
    local files = vim.fn.findfile("deno.json", ".;")
    return #files > 0
  end,
  bun = function()
    local files = vim.fn.findfile("bun.lock", ".;")
    return #files > 0
  end,
  node = function()
    local files = vim.fn.findfile("package.json", ".;")
    return #files > 0
  end,
}

---@param cb function|nil
---@return any
local function with_deno(cb)
  cb = cb or function() end

  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })

  if #files == 0 then
    -- not a deno project
    return
  end

  -- execute callback
  return cb()
end

--- Match the runtime environment based on the presence of specific files.
---
--- @param matcher table<string, any> A table containing runtime matchers for different environments.
--- The keys should be one of the following strings: "deno", "bun", "node", "default".
---
--- @return any The matched runtime environment based on the presence of specific files.
local function runtime_matcher(matcher)
  if is.deno() and matcher["deno"] ~= nil then
    return matcher["deno"]
  end

  if is.bun() and matcher["bun"] ~= nil then
    return matcher["bun"]
  end

  if is.node() and matcher["node"] ~= nil then
    return matcher["node"]
  end

  return matcher["default"]
end

return {
  with_deno = with_deno,
  runtime_matcher = runtime_matcher,
}
