return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      local ok, neoscroll = pcall(require, "neoscroll")
      if not ok then
        return
      end

      -- Use current, non-deprecated options per neoscroll README
      neoscroll.setup({
        -- Disable default keymaps; define custom ones below
        mappings = {},
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = true,
        cursor_scrolls_alone = true,
        easing = "quadratic",
        performance_mode = true,
      })

      -- Custom mappings using helper functions (recommended)
      local modes = { 'n', 'v', 'x' }
      local map = function(lhs, rhs)
        vim.keymap.set(modes, lhs, rhs, { silent = true, desc = 'Smooth scroll ' .. lhs })
      end

      map('<C-u>', function() neoscroll.ctrl_u({ duration = 200 }) end)
      map('<C-d>', function() neoscroll.ctrl_d({ duration = 200 }) end)
      map('<C-b>', function() neoscroll.ctrl_b({ duration = 300 }) end)
      map('<C-f>', function() neoscroll.ctrl_f({ duration = 300 }) end)
      map('<C-y>', function() neoscroll.scroll(-0.10, { move_cursor = false, duration = 100 }) end)
      map('<C-e>', function() neoscroll.scroll( 0.10, { move_cursor = false, duration = 100 }) end)
      map('zt',    function() neoscroll.zt({ half_win_duration = 200 }) end)
      map('zz',    function() neoscroll.zz({ half_win_duration = 200 }) end)
      map('zb',    function() neoscroll.zb({ half_win_duration = 200 }) end)
    end,
  },
}
