local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("i", "<C-h>", "<Esc><C-w>h", opts)
map("i", "<C-j>", "<Esc><C-w>j", opts)
map("i", "<C-k>", "<Esc><C-w>k", opts)
map("i", "<C-l>", "<Esc><C-w>l", opts)

-- Close buffer
map("n", "<leader>x", ":bd<CR>", opts)

-- Naviagate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text: https://vim.fandom.com/wiki/Moving_lines_up_or_down

local sally_up = vim.tbl_deep_extend("force", { desc = "Move sally up" }, opts)
local sally_down =
  vim.tbl_deep_extend("force", { desc = "Move sally down" }, opts)

map("n", "<A-j>", ":m .+1<CR>==", sally_up)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", sally_up)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", sally_up)

map("n", "<A-k>", ":m .-2<CR>==", sally_down)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", sally_down)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", sally_down)

-- Toggle checkbox item in markdown

local toggle_checkbox_opts =
  vim.tbl_deep_extend("force", { desc = "Toggle checkbox" }, opts)

local function toggle_checkbox()
  local line = vim.api.nvim_get_current_line()
  local unchecked = "%[ %]"
  local checked = "%[x%]"
  local output = line

  if string.match(line, unchecked) then
    output = string.gsub(line, unchecked, "[x]")
  elseif string.match(line, checked) then
    output = string.gsub(line, checked, "[ ]")
  end

  vim.api.nvim_set_current_line(output)
end

local function v_toggle_checkbox()
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]

  for i = start_line, end_line, 1 do
    vim.api.nvim_win_set_cursor(0, { i, 0 })
    toggle_checkbox()
  end
end

map("n", "<C-c><C-c>", toggle_checkbox, toggle_checkbox_opts)
map("v", "<C-c><C-c>", v_toggle_checkbox, toggle_checkbox_opts)

-- Toggle Theme w/ base46

local function toggle_theme()
  require("base46").toggle_theme()
end

local theme_opts = vim.tbl_deep_extend("force", { desc = "Toggle Theme" }, opts)

map("n", "<leader>tt", toggle_theme, theme_opts)

-- Oil.nvim
map("n", "<leader>o", ":Oil<CR>", { desc = "Open Oil" })
map("n", "<leader>.", ":vsplit | Oil<CR>", { desc = "Open Oil splited" })

-- Split with terminal
map("n", "<leader>;", ":split | term<CR>", { desc = "split terminal" })
map("n", "<leader>'", ":vsplit | term<CR>", { desc = "vsplit terminal" })

--- win navigation for terminal
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- autocmd to open terminal in insert mode
vim.cmd(
  [[autocmd TermOpen term://* startinsert | setlocal nonumber norelativenumber ]]
)
-- on enter terminal do the same
vim.cmd(
  [[autocmd WinEnter term://* startinsert | setlocal nonumber norelativenumber]]
)
