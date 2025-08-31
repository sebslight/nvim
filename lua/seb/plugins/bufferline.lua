return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true

    local ok_tokyo, tn_colors = pcall(require, 'tokyonight.colors')
    local c = ok_tokyo and tn_colors.setup() or {
      bg = '#1a1b26',
      bg_highlight = '#292e42',
      fg = '#c0caf5',
      fg_dark = '#a9b1d6',
      blue = '#7aa2f7',
    }

    require('bufferline').setup {
      highlights = {
        fill = { bg = c.bg }, -- remove black gap at the right
        background = { bg = c.bg },
        separator = { fg = c.bg, bg = c.bg },
        separator_visible = { fg = c.bg, bg = c.bg },
        separator_selected = { fg = c.bg, bg = c.bg_highlight },
        tab = { bg = c.bg, fg = c.fg_dark },
        tab_selected = { bg = c.bg_highlight, fg = c.fg, bold = true },
        tab_close = { bg = c.bg },
        close_button = { bg = c.bg },
        close_button_visible = { bg = c.bg },
        close_button_selected = { bg = c.bg_highlight },
        indicator_selected = { fg = c.blue, bg = c.bg_highlight },
      },
      options = {
        mode = 'buffers',
        always_show_bufferline = false,
        color_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = 'thin',
        indicator = { style = 'underline' },
        modified_icon = '●',
        diagnostics = false,
        -- Hide utility/special buffers from the list
        custom_filter = function(bufnr)
          local ft = vim.bo[bufnr].filetype
          if ft == 'neo-tree' or ft == 'qf' or ft == 'help' or ft == 'gitcommit' then
            return false
          end
          return true
        end,
        close_command = function(bufnr)
          require('mini.bufremove').delete(bufnr, false)
        end,
        right_mouse_command = function(bufnr)
          require('mini.bufremove').delete(bufnr, false)
        end,
        -- No offsets: start buffers at the very left, flush with edge
      },
    }

    -- Ensure TabLineFill and BufferLineFill match the theme background (kill black gaps)
    local function apply_fill_hl()
      pcall(vim.api.nvim_set_hl, 0, 'TabLineFill', { bg = c.bg, fg = c.fg_dark })
      pcall(vim.api.nvim_set_hl, 0, 'BufferLineFill', { bg = c.bg, fg = c.fg_dark })
      pcall(vim.api.nvim_set_hl, 0, 'BufferLineSeparator', { fg = c.bg, bg = c.bg })
      pcall(vim.api.nvim_set_hl, 0, 'BufferLineSeparatorVisible', { fg = c.bg, bg = c.bg })
      pcall(vim.api.nvim_set_hl, 0, 'BufferLineSeparatorSelected', { fg = c.bg, bg = c.bg_highlight })
    end
    apply_fill_hl()
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('seb.bufferline.hls', { clear = true }),
      callback = function()
        local ok2, tn2 = pcall(require, 'tokyonight.colors')
        if ok2 then c = tn2.setup() end
        apply_fill_hl()
      end,
    })
  end,
}
