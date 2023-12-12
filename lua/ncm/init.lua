Name = "Neovim Config Manager"
Description = "A plugin to manage multiple neovim configs"

local M = {}

function M.setup()
  -- setup deps
  require("telescope").load_extension("ui-select")

  -- setup commands
  local opts = { nargs = "?" }
  vim.api.nvim_create_user_command(
    "Config",
    require("ncm.ncm").config_command,
    opts
  )
end

return M
