local function typescript_formatter()
  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })
  local is_deno_project = #files > 0

  if is_deno_project then
    return { "deno_fmt" }
  end

  return { "biome", "eslint", "prettierd", "prettier" }
end

local options = {
  formatters_by_ft = {
    zig = { "zigfmt" },
    lua = { "stylua", "luacheck" },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    -- typescript formatter
    javascript = typescript_formatter,
    typescript = typescript_formatter,
    typescriptreact = typescript_formatter,
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Conform will run multiple formatters sequentially
    go = { "goimports", "gofmt" },
    -- Solidity
    solidity = { "forge_fmt" },
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
