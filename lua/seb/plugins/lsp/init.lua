-- Aggregate LSP/completion/formatting plugins
return {
  -- Core LSP configs (Neovim 0.11 style via vim.lsp.config / vim.lsp.enable)
  { import = "seb.plugins.lsp.mason" },
  { import = "seb.plugins.lsp.servers" },
  { import = "seb.plugins.lsp.fidget" },
  { import = "seb.plugins.lsp.blink" },
  { import = "seb.plugins.lsp.lazydev" },
  { import = "seb.plugins.lsp.conform" },
}

