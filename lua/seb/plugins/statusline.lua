return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.o.laststatus = 3 -- global statusline

      local ok_tokyo, tokyo = pcall(require, 'tokyonight.colors')
      local colors = ok_tokyo and tokyo.setup() or {
        bg = '#1a1b26',
        bg_highlight = '#292e42',
        fg = '#c0caf5',
        fg_dark = '#a9b1d6',
        blue = '#7aa2f7',
        cyan = '#7dcfff',
        green = '#9ece6a',
        magenta = '#bb9af7',
        red = '#f7768e',
        yellow = '#e0af68',
      }

      local function hide_in_width()
        return vim.fn.winwidth(0) > 80
      end

      -- Use gitsigns data for diff when available
      local function gitsigns_diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
        end
      end

      local function lsp_names()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients { bufnr = bufnr }
        if #clients == 0 then
          return ''
        end
        local names = {}
        for _, c in ipairs(clients) do
          if c.name ~= 'copilot' then
            table.insert(names, string.upper(c.name))
          end
        end
        return table.concat(names, ' | ')
      end

      -- Show GitHub Copilot status as an icon when enabled
      local function copilot_icon()
        local ok, enabled = pcall(function()
          return vim.fn['copilot#Enabled']()
        end)
        if ok and enabled == 1 then
          return ''
        end
        return ''
      end

      local function cwd_name()
        local cwd = vim.loop.cwd() or vim.fn.getcwd()
        return vim.fn.fnamemodify(cwd, ':t')
      end

      require('lualine').setup {
        options = {
          theme = 'tokyonight',
          globalstatus = true,
          component_separators = { left = '│', right = '│' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { statusline = { 'neo-tree', 'alpha', 'dashboard' } },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              padding = 1,
            },
          },
          lualine_b = {
            {
              'filename',
              path = 0, -- filename only
              symbols = { modified = '●', readonly = '', unnamed = '[No Name]' },
              colored = true,
            },
            {
              'branch',
              icon = '',
              color = { gui = 'bold' },
              cond = hide_in_width,
            },
            {
              'diff',
              source = gitsigns_diff_source,
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
              },
              cond = hide_in_width,
            },
          },
          lualine_c = {},
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
              colored = true,
            },
            {
              copilot_icon,
              color = { fg = colors.cyan },
              cond = function()
                local ok, enabled = pcall(function()
                  return vim.fn['copilot#Enabled']()
                end)
                return ok and enabled == 1
              end,
            },
            {
              lsp_names,
              icon = '',
              cond = hide_in_width,
            },
          },
          lualine_y = {
            { 'progress' },
          },
          lualine_z = {
            {
              cwd_name,
              color = { fg = colors.bg, bg = colors.magenta, gui = 'bold' },
              padding = 1,
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
