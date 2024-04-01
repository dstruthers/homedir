vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>n', ':bn<CR>')
vim.keymap.set('n', '<leader>N', ':noh<CR>')
vim.keymap.set('n', '<leader>p', ':bp<CR>')
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>T', ':botright :15sp<CR>:terminal<CR>A')
vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')
