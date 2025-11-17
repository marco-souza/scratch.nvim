# Neovim Configuration Handover

This document provides a comprehensive overview of the Neovim configuration, intended to help new developers understand the structure, plugins, and key functionalities.

## Project Structure

The configuration is organized into the following directories and files:

- **`init.lua`**: The main entry point of the Neovim configuration. It sets up `lazy.nvim` and loads other configuration files.
- **`lua/`**: The core directory for all Lua-based configurations.
  - **`distros/`**: Contains different distribution configurations like `mini.lua`.
  - **`plugins/`**: Manages plugin specifications for `lazy.nvim`. Each file corresponds to a set of related plugins (e.g., `ai.lua`, `completions.lua`, `lsp.lua`).
  - **`config/`**: Contains configuration files for specific plugins or features, such as `lsp.lua` and `ts_selector.lua`.
  - **`options.lua`**: Sets global Neovim options.
  - **`mappings.lua`**: Defines custom key mappings.
- **`lazy-lock.json`**: The lockfile for `lazy.nvim`, ensuring reproducible plugin versions.
- **`Dockerfile`, `docker-compose.yml`, `Makefile`**: Support for running the Neovim environment inside a Docker container.

## Key Plugins and Functionality

### Plugin Management

- **`lazy.nvim`**: A modern plugin manager for Neovim. It handles lazy-loading of plugins to improve startup time.

### Core Functionality

- **`telescope.nvim`**: A highly extendable fuzzy finder for lists. Used for finding files, buffers, and more.
- **`nvim-treesitter`**: Provides advanced syntax highlighting, indentation, and code navigation using tree-sitter parsers.

### Development and LSP

- **`nvim-lspconfig`**: A collection of configurations for the built-in LSP client. It is configured in `lua/plugins/lsp.lua` and `lua/config/lsp.lua` to support various language servers.
- **`mason.nvim`**: Manages LSP servers, formatters, and linters, making it easy to install and set up development tools.
- **`conform.nvim`**: A lightweight and opinionated formatter plugin.
- **`neodev.nvim`**: Provides full LSP support for Neovim's Lua runtime, enabling features like autocompletion and type checking for the configuration files.

### AI and Completions

- **`copilot.lua` and `copilot-chat.nvim`**: Integrates GitHub Copilot and its chat functionality directly into the editor.
- **`nvim-cmp`**: A completion engine that sources suggestions from various places, including LSP, snippets, and buffers.

### User Interface and Experience

- **`alpha-nvim`**: A fast and fully programmable dashboard.
- **`tokyonight.nvim`**: The default theme, providing a dark and visually appealing color scheme.
- **`nvim-notify`**: A notification manager for displaying messages from Neovim and plugins.

## Custom Configurations

- **`lua/plugins/personal.lua`**: A dedicated file for personal or experimental plugins and configurations, making it easy to add or remove features without altering the core setup.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone <repository-url> ~/.config/nvim
    ```
2.  **Run Neovim:**
    Open Neovim. `lazy.nvim` will automatically bootstrap itself and install all the configured plugins.

This configuration is designed to be modular and easy to extend. By reviewing the files in the `lua/plugins/` directory, you can get a clear understanding of what each plugin does and how it is configured.

