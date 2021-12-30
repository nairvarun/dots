local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify('something went worng with packer')
end


return packer.startup({function(use)
	-- packer: (so that it manages itself)
	use 'wbthomason/packer.nvim'
	
	-- other:
	-- use 'nvim-lua/popup.nvim'
	-- use 'nvim-lua/plenary.nvim'
	use 'wfxr/minimap.vim'
		-- requires 'https://github.com/wfxr/code-minimap'
		-- cargo install --locked code-minimap
	use {
		'iamcco/markdown-preview.nvim', 
		run = 'cd app && yarn install'
	}

	-- colors:
	use 'folke/tokyonight.nvim'
	-- use 'morhetz/gruvbox'
	-- use 'lifepillar/vim-solarized8'
	-- use 'arcticicestudio/nord-vim'
	-- use 'sainnhe/everforest'
	-- use 'joshdick/onedark.vim'
	-- use 'plan9-for-vimspace/acme-colors'
	-- use 'AlessandroYorba/Alduin'
	-- use 'glepnir/oceanic-material'

	if packer_bootstrap then
		require('packer').sync()
	end
end,
config = {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}
}})

