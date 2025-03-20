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

return {
  with_deno = with_deno,
}
