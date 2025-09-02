return {
  "christoomey/vim-tmux-navigator",
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disabled_keys = {
        ["<Up>"] = { "i", "v" },
        ["<Down>"] = { "i", "v" },
        ["<Left>"] = { "i", "v" },
        ["<Right>"] = { "i", "v" },
      },
    },
  },
}
