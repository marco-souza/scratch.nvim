return function(opts)
  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })

  if #files > 0 then
    return opts.deno
  end

  return opts.node
end
