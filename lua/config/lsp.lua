local ts_selector = require("config.ts_selector")

local M = {}

M.servers = {
  clangd = nil,
  rust_analyzer = nil,
  tailwindcss = nil,
  cssls = nil,
  biome = nil,
  eslint = nil,
  emmet_language_server = nil,
  gopls = nil,
  lua_ls = nil,
  html = nil,
  htmx = nil,
  denols = {
    enable = ts_selector({ node = false, deno = true }),
    root_markers = { "deno.json", "deno.jsonc", "deno.lock" },
    settings = {
      deno = {
        suggest = {
          imports = {
            hosts = {
              ["https://deno.land"] = true,
            },
          },
        },
      },
    },
  },
  ts_ls = {
    enable = ts_selector({ node = true, deno = false }),
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
  },
}

M.ensure_installed = vim.tbl_keys(M.servers)

local function setup_filetypes()
  vim.filetype.add({
    extension = {
      conf = "conf",
      env = "dotenv",
    },
    filename = {
      [".env"] = "dotenv",
      ["tsconfig.json"] = "jsonc",
      [".yamlfmt"] = "yaml",
    },
    pattern = {
      ["^%.?env%.?[a-z]$"] = "dotenv",
      ["^%.?ejs$"] = "html",
    },
  })
end

function M.setup()
  -- setup lsp servers
  for server, config in pairs(M.servers) do
    if config ~= nil then
      if not config.enable then
        goto continue
      end

      -- set config
      vim.lsp.config(server, config)
    end

    vim.lsp.enable(server)

    ::continue::
  end

  setup_filetypes()

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

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
