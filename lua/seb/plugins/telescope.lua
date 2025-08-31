return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require 'telescope'
      local themes = require 'telescope.themes'

      telescope.setup {
        extensions = {
          ['ui-select'] = themes.get_dropdown(),
        },
      }

      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'

      -- Use F (Find) prefix instead of S (Search)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fb', builtin.builtin, { desc = '[F]ind [B]uiltin pickers' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
      vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files (.)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Symbols (functions, classes, etc.)
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '[F]ind document [S]ymbols' })
      vim.keymap.set('n', '<leader>fS', function()
        if builtin.lsp_dynamic_workspace_symbols then
          builtin.lsp_dynamic_workspace_symbols()
        else
          builtin.lsp_workspace_symbols()
        end
      end, { desc = '[F]ind workspace [S]ymbols' })
      vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, { desc = '[F]ind [T]ype definitions' })

      -- Current buffer fuzzy find (dropdown)
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown { winblend = 10, previewer = false })
      end, { desc = '[/] Fuzzy find in current buffer' })

      -- Live grep restricted to open files
      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
      end, { desc = '[F]ind [/] in Open Files' })

      -- Neovim config files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind [N]eovim files' })
    end,
  },
}
