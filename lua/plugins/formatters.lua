local ts_selector = require("config.ts_selector")

local ts_server = ts_selector({
  node = { "biome", "eslint", "prettierd", "prettier" },
  deno = { "deno_fmt" },
})

local options = {
  formatters_by_ft = {
    zig = { "zigfmt" },
    lua = { "stylua", "luacheck" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },

    -- typescript formatter
    javascript = ts_server,
    typescript = ts_server,
    typescriptreact = ts_server,

    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Conform will run multiple formatters sequentially
    go = { "goimports", "gofmt" },
    -- Solidity
    solidity = { "forge_fmt" },

    -- Elixir
    elixir = { "mix" },
    eelixir = { "mix" },
    heex = { "mix" },
    surface = { "mix" },

    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 600,
    lsp_fallback = true,
  },
}

local function format()
  -- fallback to vim.lsp.buf.format()
  require("conform").format()
end

return {
  "stevearc/conform.nvim",
  event = "LspAttach",
  opts = options,
  keys = {
    { "gf", format, desc = "Format buffer" },
  },
}
