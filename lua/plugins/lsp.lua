local servers = {
  lua_ls = {},
  tsserver = {},
  rust_analyzer = {},
}

local ensure_installed = {}
for server, _ in pairs(servers) do
  table.insert(ensure_installed, server)
end

local function lspconfig_setup()
  local lspconfig = require("lspconfig")

  -- setup lsp servers
  for key, opts in pairs(servers) do
    lspconfig[key].setup(opts)
  end
end

return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      ensure_installed = ensure_installed,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = lspconfig_setup,
  },
}
