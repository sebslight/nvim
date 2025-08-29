return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      -- Format on save with LSP fallback
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      -- Choose formatters per filetype
      formatters_by_ft = {
        -- Python: use Ruff formatter
        python = { "ruff_format" },

        -- Web
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },

        -- Data/config
        json = { { "prettierd", "prettier" } },
        jsonc = { { "prettierd", "prettier" } },
        toml = { "taplo" },
        yaml = { "yamlfmt" },

        -- Shell
        sh = { "shfmt" },

        -- Lua
        lua = { "stylua" },
        -- Dockerfile (optional; prettier can handle some cases)
        dockerfile = { },
        -- VimL (no common external formatter; rely on LSP if any)
        vim = {},
      },
    },
  },
}
