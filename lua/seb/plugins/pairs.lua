return {
  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    opts = {},
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
}

