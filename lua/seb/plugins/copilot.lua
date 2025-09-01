return {
  {
    'github/copilot.vim',
    -- Attach Copilot's LSP without showing inline ghost text; integrate via blink.cmp
    event = 'BufWinEnter',
    init = function()
      -- Disable default mappings and inline accept flow; blink.cmp will be the UI
      vim.g.copilot_no_maps = true
    end,
    config = function()
      -- Block normal Copilot inline suggestions but keep the LSP client active
      local group = vim.api.nvim_create_augroup('github_copilot', { clear = true })
      vim.api.nvim_create_autocmd({ 'FileType', 'BufUnload' }, {
        group = group,
        callback = function(args)
          vim.fn['copilot#On' .. args.event]()
        end,
      })
      -- Ensure Copilot's LSP attaches for the current buffer
      pcall(vim.fn['copilot#OnFileType'])
    end,
    keys = {
      { '<leader>ie', ':Copilot enable<CR>', mode = 'n', desc = 'Copilot: Enable' },
      { '<leader>id', ':Copilot disable<CR>', mode = 'n', desc = 'Copilot: Disable' },
      { '<leader>is', ':Copilot status<CR>', mode = 'n', desc = 'Copilot: Status' },
      { '<leader>ip', ':Copilot panel<CR>', mode = 'n', desc = 'Copilot: Panel' },
    },
  },
}
