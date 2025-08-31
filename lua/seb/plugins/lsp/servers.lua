return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- General LSP on_attach customizations for 0.11+
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('seb.lsp.attach', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end
          -- Let Pyright/Based Pyright handle hover; disable Ruff hover per Ruff docs
          if client.name == 'ruff' and client.server_capabilities then
            client.server_capabilities.hoverProvider = false
          end
          -- Enable inlay hints when supported
          pcall(function()
            if client:supports_method 'textDocument/inlayHint' then
              vim.lsp.inlay_hint.enable(true, args.buf)
            end
          end)

          -- Conventional LSP keymaps (buffer-local)
          local opts = { buffer = args.buf, silent = true, noremap = true }
          local map = vim.keymap.set
          map('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'LSP: Goto Definition' }))
          map('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'LSP: Goto Declaration' }))
          map('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'LSP: Goto Implementation' }))
          map('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'LSP: References' }))
          map('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'LSP: Rename' }))
          map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'LSP: Code Action' }))
        end,
      })

      -- Use Neovim 0.11 style server extensions (vim.lsp.config)
      local cfg = vim.lsp.config

      -- Python: Based Pyright (types) + Ruff (lint/quickfix)
      cfg('basedpyright', {
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- Ruff LSP: no custom init_options needed; avoid sending empty settings table
      cfg('ruff', {})

      -- Web / frontend
      cfg('html', {})
      cfg('cssls', {})
      cfg('ts_ls', {
        -- Typescript/JavaScript/React server
        -- Further settings can go under settings = { ... } if desired
      })

      -- Data / config
      cfg('yamlls', {})
      cfg('jsonls', {})
      cfg('taplo', {}) -- TOML

      -- Containers
      cfg('dockerls', {})
      cfg('docker_compose_language_service', {})

      -- Scripting / editors
      cfg('bashls', {})
      cfg('vimls', {})

      -- Lua (LuaLS): keep minimal; lazydev.nvim augments workspace & completions
      cfg('lua_ls', {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            telemetry = { enable = false },
            hint = { enable = true },
          },
        },
      })
    end,
  },
}
