-- Minimal Setup
vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.swapfile = false

vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- plugins
vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- plugin setup
require("mini.pick").setup({})
require("oil").setup({})

vim.keymap.set("n", "<leader>ff", ":Pick files", { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", ":Pick grep_live", { desc = "Find in files" })

vim.keymap.set("n", "<leader>e", ":Oil<CR>")

-- lsp
vim.lsp.enable({
  "lua_ls",
  "markdown",
})
vim.keymap.set("n", ",<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })

-- completions
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, {
        autotrigger = true,
      })
    end
  end
})

vim.cmd("set completeopt+=noselect")
