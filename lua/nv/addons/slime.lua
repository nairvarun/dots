---- alt ==> leader
vim.g.mapleader = ''	    -- `^[`(alt) typed by `ctrl+v alt+esc`

-- config
vim.g.slime_target='tmux'
vim.g.slime_default_config={socket_name = "default", target_pane = "{last}"}

-- keymaps
vim.api.nvim_set_keymap('n', '<leader>s', 'V<Plug>SlimeRegionSend', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>S', 'V<Plug>SlimeParagraphSend', {noremap=true})
vim.api.nvim_set_keymap('x', '<leader>s', 'V<Plug>SlimeRegionSend', {noremap=true})
vim.api.nvim_set_keymap('x', '<leader>S', '<Plug>SlimeRegionSend', {noremap=true})

