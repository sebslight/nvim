return {
  -- Package manager for LSP/DAP/formatters
  {
    "williamboman/mason.nvim",
    build = false,
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {},
  },

  -- Bridge Mason <-> nvim-lspconfig (0.11+): auto-enable servers
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = function()
      -- LSP servers to install (nvim-lspconfig names)
      return {
        ensure_installed = {
          -- Python
          "basedpyright",
          "ruff",
          -- Web/markup
          "html",
          "cssls",
          "jsonls",
          -- JS/TS/React
          "ts_ls", -- typescript-language-server wrapper
          -- Data/config
          "yamlls",
          "taplo", -- TOML
          -- Containers
          "dockerls",
          "docker_compose_language_service",
          -- Shell / Lua / Vim
          "bashls",
          "lua_ls",
          "vimls",
        },
        -- Let mason-lspconfig automatically call vim.lsp.enable(),
        -- but avoid enabling both Pyright and Based Pyright at once.
        automatic_enable = {
          exclude = { "pyright" },
        },
      }
    end,
  },

  -- Install extra non-LSP tools (formatters / linters) via Mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Python formatting via Ruff
        "ruff",
        -- Web formatting
        "prettierd",
        "prettier",
        -- Lua formatting
        "stylua",
        -- Shell formatting
        "shfmt",
        -- YAML formatting
        "yamlfmt",
        -- TOML formatting (taplo provides CLI)
        "taplo",
        -- Dockerfile (dprint or dockerfmt optional; we rely on prettier/taplo where applicable)
      },
      run_on_start = true,
    },
  },
}
