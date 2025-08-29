return {
  -- Lua development experience for editing Neovim configs & plugins
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
      integrations = { lspconfig = true },
    },
  },
  -- Add lazydev as a blink.cmp source (module name provided by lazydev)
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100, -- make lazydev require/module completions top priority
      }
      -- Ensure lazydev is in the default provider list and ahead of lsp
      opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }
      local seen = {}
      local new_default = { "lazydev" }
      for _, s in ipairs(opts.sources.default) do
        if s ~= "lazydev" and not seen[s] then table.insert(new_default, s); seen[s] = true end
      end
      opts.sources.default = new_default
    end,
  },
}

