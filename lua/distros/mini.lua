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

vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- plugins
vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/github/copilot.vim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/NeogitOrg/neogit" },
  -- dependencies
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- plugin setup
require("mini.pick").setup({})
require("oil").setup({})
require("neogit").setup({})

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fw", ":Pick grep_live<CR>", { desc = "Find word" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find help" })

vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Neogit toggle" })

-- lsp
vim.lsp.enable({
  "lua_ls",
  "gopls",
  "markdown",
})
vim.keymap.set("n", ",<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })

-- completions
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})

vim.cmd("set completeopt+=noselect")
