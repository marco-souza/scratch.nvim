<h1 align="center">🦙 My Personal Neovim Setup - From Scratch</h1>

# scratch.nvim

<a href="https://dotfyle.com/marco-souza/scratchnvim"><img src="https://dotfyle.com/marco-souza/scratchnvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/marco-souza/scratchnvim"><img src="https://dotfyle.com/marco-souza/scratchnvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/marco-souza/scratchnvim"><img src="https://dotfyle.com/marco-souza/scratchnvim/badges/plugin-manager?style=flat" /></a>

## 📦 Overview

This project is my Neovim setup from scratch, named `scratch.nvim`. It provides:

- Basic editor configurations
- A beautiful colorscheme
- A comprehensive plugin setup
- Tree-sitter integration for enhanced syntax highlighting

This setup is designed for developers who want a lightweight yet powerful Neovim configuration.

## 📖 Inspiration

This setup is based on:

- [Understanding Neovim](https://www.youtube.com/watch?v=87AXw9Quy9U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft)
- [Neovim IDE from Scratch](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

## 🚀 Installation Instructions

> **Requires Neovim 0.11+**. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:marco-souza/scratch.nvim ~/.config/nvim
NVIM_APPNAME=marco-souza/scratch.nvim/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=marco-souza/scratch.nvim/ nvim
```

### Backup Existing Configuration

```sh
mv $HOME/.config/nvim $HOME/.config/nvim.bkp
```

## 🛠️ Features and Plugins

### 🎨 Colorscheme
- [rose-pine/neovim](https://github.com/rose-pine/neovim): A soothing colorscheme.

### 📝 Commenting
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim): Highlight and manage TODO comments.
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim): Simplify code commenting.

### 🧩 Completion
- [saghen/blink.cmp](https://github.com/saghen/blink.cmp): A lightweight completion plugin.

### 🛠️ Editing Support
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): Autocomplete HTML tags.
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): Automatically close brackets and quotes.

### 📂 File Explorer
- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim): Manage files like a pro.

### 🔍 Fuzzy Finder
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): A blazing fast fuzzy finder.
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Powerful file and content searching.

### 🧑‍💻 Git Integration
- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim): Visualize git diffs.
- [NeogitOrg/neogit](https://github.com/NeogitOrg/neogit): A Magit-inspired git plugin.

### 📏 Indentation
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Display indentation guides.

### 🔑 Keybinding
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim): Display available keybindings.

### 🤖 Language Servers
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Configure LSP servers easily.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Manage LSP servers, formatters, and linters.

### 📍 Marks
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon): Navigate and manage marks easily.

### 🔧 Plugin Development
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): Utility functions for Neovim plugins.
- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI components for plugins.

### 📜 Snippets
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets): Predefined snippets for various languages.

### 🌟 Startup
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim): A customizable startup screen.

### 📊 Statusline
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A fast and customizable statusline.

### 🖋️ Syntax
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround): Manage surrounding characters.
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and parsing.
- [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects): Enhanced text object support.

## 📚 Language Servers

This setup supports multiple language servers managed via `mason.nvim`. Configure as needed.

## 🛠️ Dependencies

- `git`: Required to clone the repository.
- `lazy.nvim`: Installed automatically.

## 🌟 Usage

```sh
# Backup old config
mv $HOME/.config/nvim $HOME/.config/nvim.bkp

# Clone the config
git clone git@github.com:marco-souza/scratch.nvim.git $HOME/.config/nvim
# Or use HTTPS
git clone https://github.com/marco-souza/scratch.nvim.git $HOME/.config/nvim
```

Enjoy your enhanced Neovim experience! 🎉
