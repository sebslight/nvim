return {
  {
    'echasnovski/mini.bufremove',
    version = false,
    opts = {},
    config = function(_, opts)
      require('mini.bufremove').setup(opts)
    end,
  },
}

