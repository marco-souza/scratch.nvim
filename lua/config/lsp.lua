local M = {}

local function ts_server()
  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })
  local is_deno_project = #files > 0

  if is_deno_project then
    return "denols"
  end

  return "ts_ls"
end

local servers = {
  "clangd",
  "rust_analyzer",
  "tailwindcss",
  "cssls",
  "biome",
  "eslint",
  "emmet_language_server",
  "gopls",
  "lua_ls",
  "html",
  "htmx",
  ts_server,
}

function M.list_servers()
  local ensure_installed = {}

  for _, server in ipairs(servers) do
    if type(server) == "string" then
      table.insert(ensure_installed, server)
    elseif type(server) == "function" then
      table.insert(ensure_installed, server())
    end
  end

  return ensure_installed
end

function M.setup()
  -- setup lsp servers
  for _, server in ipairs(M.list_servers()) do
    vim.lsp.enable(server)
  end

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Global mappings for diagnostics
      --
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      --
      local goto_diagnostic = function(count)
        return function()
          vim.diagnostic.jump({
            count = count,
            float = true,
          })
        end
      end

      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", goto_diagnostic(-1))
      vim.keymap.set("n", "]d", goto_diagnostic(1))
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

      -- Global mappings for lsp
      --
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set(
        "n",
        "<space>wr",
        vim.lsp.buf.remove_workspace_folder,
        opts
      )
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)

      -- vim.keymap.set("n", "<space>f", function()
      --   vim.lsp.buf.format({ async = true })
      -- end, opts)
    end,
  })
end

return M
