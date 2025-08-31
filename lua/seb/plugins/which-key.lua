return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    -- New style spec for groups (as suggested by which-key checks)
    wk.add {
      { '<leader>s', group = 'Sessions' },
      { '<leader>sr', desc = 'Session: Restore' },
      { '<leader>sl', desc = 'Session: Restore last' },
      { '<leader>sd', desc = 'Session: Disable saving' },
      -- Harpoon
      { '<leader>a', desc = 'Harpoon: Add file' },
      { '<C-e>', desc = 'Harpoon: Toggle quick menu' },
      { '<C-S-P>', desc = 'Harpoon: Previous mark' },
      { '<C-S-N>', desc = 'Harpoon: Next mark' },
      { '<C-1>', desc = 'Harpoon: Select 1' },
      { '<C-2>', desc = 'Harpoon: Select 2' },
      { '<C-3>', desc = 'Harpoon: Select 3' },
      { '<C-4>', desc = 'Harpoon: Select 4' },
      { '<leader>i', group = 'AI' },
      { '<leader>ie', desc = 'Copilot: Enable' },
      { '<leader>id', desc = 'Copilot: Disable' },
      { '<leader>is', desc = 'Copilot: Status' },
      { '<leader>ip', desc = 'Copilot: Panel' },
      { '<leader>f', group = 'Find' },
      -- Find (Telescope) mappings
      { '<leader>ff', desc = 'Find Files' },
      { '<leader>fh', desc = 'Find Help' },
      { '<leader>fk', desc = 'Find Keymaps' },
      { '<leader>fb', desc = 'Find Builtin pickers' },
      { '<leader>fw', desc = 'Find current Word' },
      { '<leader>fg', desc = 'Find by Grep' },
      { '<leader>fd', desc = 'Find Diagnostics' },
      { '<leader>fr', desc = 'Find Resume' },
      { '<leader>f.', desc = 'Find Recent Files' },
      { '<leader>f/', desc = 'Find in Open Files' },
      { '<leader>fn', desc = 'Find Neovim files' },
      { '<leader>fT', desc = 'Find TODOs' },
      { '<leader>fs', desc = 'Find Document Symbols' },
      { '<leader>fS', desc = 'Find Workspace Symbols' },
      { '<leader>ft', desc = 'Find Type Definitions' },
      { '<leader>b', group = 'Buffers' },
      { '<leader>d', group = 'Diagnostics' },
      { '<leader>e', group = 'Explorer' },
      { '<leader>l', group = 'Toggles' },
      { '<leader>q', group = 'Quit' },
      { '<leader>t', group = 'Tabs' },
      { '<leader>w', group = 'Windows' },
      { '<leader>y', group = 'Clipboard' },
    }
  end,
}
