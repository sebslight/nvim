return {
  -- Treesitter-aware comments, works well for TSX/JSX/embedded langs
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = { enable_autocmd = false },
        config = function(_, o)
          require('ts_context_commentstring').setup(o)
        end,
      },
    },
    opts = function()
      local pre
      pcall(function()
        pre = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      end)
      return { pre_hook = pre }
    end,
    config = function(_, opts)
      require('Comment').setup(opts)
    end,
  },
}

