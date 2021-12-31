local _inDegen = false
function _G.toggleDgen()
	_inDegen = not _inDegen
	if _inDegen then
		print('-- DEGEN --')
		vim.api.nvim_set_keymap('n', '<leader>r', ':echo"yesy"<CR>', {noremap = true, silent = true})
		-- vim.api.nvim_exec([[call feedkeys("\<C-w>=")]], true)
	else
		print(' ')
		--vim.api.nvim_del_keymap('n', '<A-r>', ':echo"yesy"<CR>', {noremap = true, silent = true})
		vim.api.nvim_del_keymap('n', '<leader>r')
	end
	return _inDegen
end

--vim.api.nvim_set_keymap('n', '<leader>d', ':lua toggleDgen()<CR>', {noremap = true, silent = true})
