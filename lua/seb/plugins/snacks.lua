return {
  {
    'folke/snacks.nvim',
    event = 'VimEnter',
    opts = {
      dashboard = { enabled = true },
    },
    config = function(_, opts)
      local ok, snacks = pcall(require, 'snacks')
      if ok then snacks.setup(opts or {}) end
    end,
  },
}
