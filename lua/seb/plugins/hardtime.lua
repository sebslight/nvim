return {
  'm4xshen/hardtime.nvim',
  lazy = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    max_time = 2000, -- the maximum time (in ms) allowed between key presses
    max_count = 5, -- the maximum number of key presses allowed within the max_time
  },
}
