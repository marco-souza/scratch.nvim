-- Minimal Setup
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false

-- copy/paste
vim.o.clipboard = "unnamedplus"

-- fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 0

-- term colors
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- plugins
vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { src = "https://github.com/github/copilot.vim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/NeogitOrg/neogit" },
  -- dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

vim.cmd(":hi statusline guibg=NONE")

-- plugin setup
require("mini.pick").setup({})
require("oil").setup({})
require("neogit").setup({})

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fw", ":Pick grep_live<CR>", { desc = "Find word" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find help" })

vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.keymap.set("n", "<leader>G", ":Neogit<CR>", { desc = "Neogit toggle" })

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to [d]efinition", buffer = true })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { desc = "[r]ename", buffer = true })
vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = "code [a]ction", buffer = true })

-- treesitter
vim.treesitter.language.register('go', {
  'gomod',
  'gowork',
  'gotmpl',
})

-- lsp
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        special = { reload = "require" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
        },
      },
    },
  },
})

vim.lsp.enable({
  "lua_ls",
  "gopls",
})

-- completions
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    print("LSP attached", ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      return
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end
})

vim.cmd("set completeopt+=noselect")
