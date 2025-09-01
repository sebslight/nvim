return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "*",
    dependencies = {
      -- Integrate GitHub Copilot into blink.cmp's completion menu
      { "fang2hou/blink-copilot" },
    },
    opts = {
      -- Feature-rich default experience
      keymap = {
        -- Use the 'enter' preset to accept with <CR>
        preset = "enter",
        -- Dismiss menu: Ctrl-] cancels (reverts any preview)
        ["<C-]>"] = { "cancel" },
        -- Close the menu and revert any auto_insert preview
        -- If menu is open: cancel; then fallback Esc to exit Insert mode
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
        -- Add Copilot as a source via the native blink-copilot provider
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            -- Make Copilot suggestions easy to notice without overwhelming others
            score_offset = 100,
            async = true,
            -- You can fine-tune blink-copilot options here, e.g.:
            -- opts = { max_completions = 3, max_attempts = 4 },
          },
        },
      },
      -- Enable signature help by default
      signature = { enabled = true },
    },
  },
}
