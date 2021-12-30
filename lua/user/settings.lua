vim.cmd[[
	syntax on
	filetype plugin indent on
]]

-- :help options
vim.opt.mouse 			= 'a'
vim.opt.clipboard 		= 'unnamedplus'
vim.opt.shiftwidth 		= 4
vim.opt.tabstop 		= 4
vim.opt.foldmethod		= 'marker'
vim.opt.relativenumber 	= true
vim.opt.cursorline 		= true
vim.opt.hlsearch 		= true
vim.opt.ignorecase 		= true
vim.opt.smartcase 		= true
vim.opt.splitbelow 		= true
vim.opt.splitright 		= true
vim.opt.timeoutlen 		= 100
vim.opt.undofile 		= true
vim.opt.scrolloff 		= 5
vim.opt.sidescrolloff 	= 5
vim.opt.visualbell 		= true
vim.opt.termguicolors	= true
vim.opt.wrap			= false
vim.opt.showtabline		= 1

local colorscheme = 'tokyonight'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme )
if not status_ok then
	vim.cmd 'PackerSync'
	vim.notify('installing ' .. colorscheme .. '. pls restart nvim once done.')
	return
end

vim.cmd[[
	augroup settings
		autocmd!
		autocmd BufWritePost */nvim/**.lua source <afile> 
		autocmd BufWritePost plugins.lua PackerSync 
	augroup end
]]

