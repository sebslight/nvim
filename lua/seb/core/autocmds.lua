-- Flash yanked text for quick visual feedback
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('seb.highlight_yank', { clear = true }),
  callback = function()
    pcall(vim.highlight.on_yank, { higroup = 'IncSearch', timeout = 150 })
  end,
})

-- Ensure sidebars are closed before exit so sessions don't record them
vim.api.nvim_create_autocmd('VimLeavePre', {
  group = vim.api.nvim_create_augroup('seb.close_sidebars', { clear = true }),
  callback = function()
    pcall(vim.cmd, 'Neotree close')
  end,
})

-- Auto-cd to project root (git, etc.) when entering a buffer
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = vim.api.nvim_create_augroup('seb.rooter', { clear = true }),
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    if name == '' then return end
    local path = vim.fs.dirname(name)
    local root_markers = { '.git', 'pyproject.toml', 'package.json', 'Cargo.toml', '.hg', '.svn' }
    local found = vim.fs.find(root_markers, { path = path, upward = true, stop = vim.loop.os_homedir() })
    if #found > 0 then
      local root = vim.fs.dirname(found[1])
      if root and root ~= '' and root ~= vim.loop.cwd() then
        pcall(vim.cmd.cd, root)
      end
    end
  end,
})
