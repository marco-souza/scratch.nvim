local servers = {
  clangd = {},
  rust_analyzer = {},
  tailwindcss = {},
  cssls = {},
  eslint = {
    settings = {
      packageManager = "bun",
    },
  },
  biome = {},
  emmet_ls = {
    filetypes = {
      "css",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "svelte",
      "pug",
      "typescriptreact",
      "hbs",
      "handlebars",
    },
  },
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
  lua_ls = {
    {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },
  html = {
    filetypes = { "html", "hbs", "handlebars" },
  },
  htmx = {
    filetypes = { "html", "tsx", "gotmpl" },
  },
  zls = {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    single_file_support = true,
  },
}

-- setup js/ts server
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

local typescript = require("utils.js").runtime_matcher({
  deno = "denols",
  default = "ts_ls",
})

servers[typescript] = require("utils.js").runtime_matcher({
  deno = {
    init_options = {
      lint = true,
      format = true,
      unstable = true,
    },
  },
  default = {},
})

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
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
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

return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = lspconfig_setup,
    dependencies = {
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
    },
  },
}
