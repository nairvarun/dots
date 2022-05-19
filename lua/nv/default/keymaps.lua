------ leader ==> alt
-- vim.api.nvim_set_keymap('', '', '<Nop>', {noremap = true})         -- if <alt> is set to <Nop> Alt+{x} wont sent the escape signal in any terminal
vim.g.mapleader = ''                                                  -- `^[`(alt) typed by `ctrl+v alt+esc`

------ esc
-- vim.api.nvim_set_keymap('!', '<leader>i', '<esc>', {noremap=true})

------ block selection ==> v
-- `v` toggles between block visual and then visual
vim.api.nvim_set_keymap('n', 'v', '<C-v>', {noremap=true})

------ leader+w ==> save
vim.api.nvim_set_keymap('n', '<leader>w', '<esc>:w<CR>', {noremap=true})
vim.api.nvim_set_keymap('i', '<leader>w', '<esc>:w<CR>', {noremap=true})

------ $
vim.api.nvim_set_keymap('n', '<leader>e', '$', {noremap=true})
vim.api.nvim_set_keymap('x', '<leader>e', '$', {noremap=true})
vim.api.nvim_set_keymap('o', '<leader>e', '$', {noremap=true})

------ %
---- noremap os false so that html tags work
vim.api.nvim_set_keymap('n', '<leader>p', '%', {noremap=false})
vim.api.nvim_set_keymap('x', '<leader>p', '%', {noremap=false})

------ next, prev, path completion, omnicomplition
vim.api.nvim_set_keymap('i', '<leader>j', '<C-n>', {noremap=true})
vim.api.nvim_set_keymap('i', '<leader>k', '<C-p>', {noremap=true})
vim.api.nvim_set_keymap('i', '<leader>n', '<C-x><C-o>', {noremap=true})
vim.api.nvim_set_keymap('i', '<leader>m', '<C-x><C-f>', {noremap=true})

-- buffer navigation
vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>bn<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>bp<CR>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<Tab>', ':b ', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':find ', {noremap=true})

------ tab navigation
-- vim.api.nvim_set_keymap('n', '<leader>l', 'gt', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<leader>h', 'gT', {noremap=true})

------ split navigation
-- vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap=true})

------ toggle split focus
-- local isFocused = false
-- function toggleFocus()
--     if (isFocused) then
--         vim.api.nvim_exec([[call feedkeys("\<C-w>=")]], true)
--     else
--         vim.api.nvim_exec([[call feedkeys("\<C-w>|\<C-w>_")]], true)
--     end
--     isFocused = not isFocused
-- end
-- vim.api.nvim_set_keymap('n', '<leader>;', '<cmd>lua toggleFocus()<CR>', {noremap=true, silent=true})

------ remove highlights
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>noh<CR>', {noremap=true})

------ Lexplore
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Lexplore 20<CR>', {noremap=true})



