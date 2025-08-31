return {
  {
    'github/copilot.vim',
    -- Load early so statusline can reflect Copilot state immediately
    event = 'VeryLazy',
    config = function()
      -- Use <Tab> to accept when visible, otherwise insert a literal Tab
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      -- Accept with <Tab> (falls back to a literal Tab when no suggestion)
      vim.keymap.set('i', '<Tab>', 'copilot#Accept("\t")', {
        expr = true,
        silent = true,
        replace_keycodes = false,
        desc = 'Copilot: Accept',
      })

      -- Dismiss suggestions: Ctrl-\ to dismiss and stay in insert
      vim.keymap.set('i', '<C-\\>', function()
        pcall(vim.fn['copilot#Dismiss'])
        return ''
      end, { expr = true, silent = true, desc = 'Copilot: Dismiss' })

      -- Cycle suggestions
      vim.keymap.set('i', '<M-]>', 'copilot#Next()', { expr = true, silent = true, desc = 'Copilot: Next' })
      vim.keymap.set('i', '<M-[>', 'copilot#Previous()', { expr = true, silent = true, desc = 'Copilot: Previous' })

      -- Ensure Copilot is enabled on startup so it's immediately active
      -- Schedule to avoid race conditions during very early init
      vim.schedule(function()
        pcall(vim.cmd, 'Copilot enable')
      end)
    end,
    keys = {
      { '<leader>ie', ':Copilot enable<CR>', mode = 'n', desc = 'Copilot: Enable' },
      { '<leader>id', ':Copilot disable<CR>', mode = 'n', desc = 'Copilot: Disable' },
      { '<leader>is', ':Copilot status<CR>', mode = 'n', desc = 'Copilot: Status' },
      { '<leader>ip', ':Copilot panel<CR>', mode = 'n', desc = 'Copilot: Panel' },
    },
  },
}
