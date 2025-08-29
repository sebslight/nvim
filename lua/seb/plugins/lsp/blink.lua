return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "*",
    opts = {
      -- Feature-rich default experience
      keymap = {
        -- Use the 'enter' preset to accept with <CR>
        preset = "enter",
        -- Close the menu and revert any auto_insert preview
        ["<Esc>"] = { "cancel", "fallback" },
        -- Explicitly open completion
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = false, auto_insert = true } },
        menu = {
          auto_show = true,
          draw = {
            -- nvim-cmp style columns: label + description, then kind icon/name
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = true },
      },
      sources = {
        -- default providers; lazydev source is injected by lazydev plugin spec
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- Enable signature help by default
      signature = { enabled = true },
    },
  },
}
