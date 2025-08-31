return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {
      options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
      pre_save = function()
        -- Close sidebars and special windows before saving a session
        pcall(vim.cmd, 'Neotree close')
        -- You can add more here if needed: Trouble, Outline, etc.
      end,
    },
    config = function(_, opts)
      require('persistence').setup(opts)
    end,
    keys = {
      { '<leader>sr', function() require('persistence').load() end, desc = 'Session: Restore' },
      { '<leader>sl', function() require('persistence').load { last = true } end, desc = 'Session: Restore last' },
      { '<leader>sd', function() require('persistence').stop() end, desc = 'Session: Disable saving' },
    },
  },
}
