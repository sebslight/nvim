return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      enable = true,
      max_lines = 3,
      multiline_threshold = 1,
      line_numbers = true,
      mode = 'cursor',
      separator = '─',
    },
    config = function(_, opts)
      require('treesitter-context').setup(opts)
    end,
  },
}

