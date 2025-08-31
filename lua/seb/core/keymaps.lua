-- Disable the space key's default behavior in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Disable <Space> default' })


local opts = { noremap = true, silent = true }
-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', vim.tbl_extend('force', opts, { desc = 'Save file' }))

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', vim.tbl_extend('force', opts, { desc = 'Quit window' }))

-- quit all
vim.keymap.set('n', '<leader>qq', '<cmd> qa <CR>', vim.tbl_extend('force', opts, { desc = 'Quit all' }))

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', vim.tbl_extend('force', opts, { desc = 'Delete without yanking' }))

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', vim.tbl_extend('force', opts, { desc = 'Half-page down + center' }))
vim.keymap.set('n', '<C-u>', '<C-u>zz', vim.tbl_extend('force', opts, { desc = 'Half-page up + center' }))

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', vim.tbl_extend('force', opts, { desc = 'Next search result + center' }))
vim.keymap.set('n', 'N', 'Nzzzv', vim.tbl_extend('force', opts, { desc = 'Prev search result + center' }))

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', vim.tbl_extend('force', opts, { desc = 'Resize split: height -2' }))
vim.keymap.set('n', '<Down>', ':resize +2<CR>', vim.tbl_extend('force', opts, { desc = 'Resize split: height +2' }))
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', vim.tbl_extend('force', opts, { desc = 'Resize split: width -2' }))
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', vim.tbl_extend('force', opts, { desc = 'Resize split: width +2' }))

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', vim.tbl_extend('force', opts, { desc = 'Next buffer' }))
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', vim.tbl_extend('force', opts, { desc = 'Previous buffer' }))
-- Grouped under <leader>b
-- Use: <leader>bb (new), <leader>bd (close), <leader>bn/bp (next/prev)
-- Grouped duplicates under <leader>b
vim.keymap.set('n', '<leader>bb', '<cmd> enew <CR>', vim.tbl_extend('force', opts, { desc = 'New buffer' }))
vim.keymap.set('n', '<leader>bd', function()
  require('mini.bufremove').delete(0, false)
end, vim.tbl_extend('force', opts, { desc = 'Buffer: delete' }))
vim.keymap.set('n', '<leader>bD', function()
  require('mini.bufremove').delete(0, true)
end, vim.tbl_extend('force', opts, { desc = 'Buffer: delete (force)' }))
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', vim.tbl_extend('force', opts, { desc = 'Next buffer' }))
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', vim.tbl_extend('force', opts, { desc = 'Previous buffer' }))

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', vim.tbl_extend('force', opts, { desc = 'Increment number' }))
vim.keymap.set('n', '<leader>-', '<C-x>', vim.tbl_extend('force', opts, { desc = 'Decrement number' }))

-- Window management
-- Windows group under <leader>w
vim.keymap.set('n', '<leader>wv', '<C-w>v', vim.tbl_extend('force', opts, { desc = 'Window: split vertically' }))
vim.keymap.set('n', '<leader>wh', '<C-w>s', vim.tbl_extend('force', opts, { desc = 'Window: split horizontally' }))
vim.keymap.set('n', '<leader>we', '<C-w>=', vim.tbl_extend('force', opts, { desc = 'Window: equalize sizes' }))
vim.keymap.set('n', '<leader>wc', ':close<CR>', vim.tbl_extend('force', opts, { desc = 'Window: close' }))

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', vim.tbl_extend('force', opts, { desc = 'Focus split: up' }))
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', vim.tbl_extend('force', opts, { desc = 'Focus split: down' }))
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', vim.tbl_extend('force', opts, { desc = 'Focus split: left' }))
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', vim.tbl_extend('force', opts, { desc = 'Focus split: right' }))

-- Tabs
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>', vim.tbl_extend('force', opts, { desc = 'New tab' }))
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', vim.tbl_extend('force', opts, { desc = 'Close tab' }))
vim.keymap.set('n', 'L', ':tabn<CR>', vim.tbl_extend('force', opts, { desc = 'Next tab' }))
vim.keymap.set('n', 'H', ':tabp<CR>', vim.tbl_extend('force', opts, { desc = 'Previous tab' }))
-- Grouped duplicates under <leader>t
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', vim.tbl_extend('force', opts, { desc = 'Next tab' }))
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', vim.tbl_extend('force', opts, { desc = 'Previous tab' }))

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', vim.tbl_extend('force', opts, { desc = 'Toggle line wrap' }))

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', vim.tbl_extend('force', opts, { desc = 'Exit insert mode' }))
vim.keymap.set('i', 'kj', '<ESC>', vim.tbl_extend('force', opts, { desc = 'Exit insert mode' }))

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', vim.tbl_extend('force', opts, { desc = 'Indent left and reselect' }))
vim.keymap.set('v', '>', '>gv', vim.tbl_extend('force', opts, { desc = 'Indent right and reselect' }))

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', vim.tbl_extend('force', opts, { desc = 'Move selection down' }))
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', vim.tbl_extend('force', opts, { desc = 'Move selection up' }))

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', vim.tbl_extend('force', opts, { desc = 'Paste over (keep clipboard)' }))

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], vim.tbl_extend('force', opts, { desc = 'Yank to system clipboard' }))
vim.keymap.set('n', '<leader>Y', [["+Y]], vim.tbl_extend('force', opts, { desc = 'Yank line to system clipboard' }))

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(true)
  else
    vim.diagnostic.enable(false)
  end
end, vim.tbl_extend('force', opts, { desc = 'Diagnostics: Toggle enable/disable' }))

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Diagnostics: Line hover' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Diagnostics: Open location list' })
vim.keymap.set('n', '<leader>dj', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Diagnostics: Next' })
vim.keymap.set('n', '<leader>dk', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Diagnostics: Prev' })
