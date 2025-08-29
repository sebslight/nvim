return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    main = "tokyonight",
    opts = {
      style = "night",
      styles = { comments = { italic = true } },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)   -- you must call setup here when using config
      vim.cmd.colorscheme("tokyonight")   -- or "tokyonight-night"
    end,
  },
}
