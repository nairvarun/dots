---- bootstrap packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

---- install plugins
require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'                    -- so that packer manages itself
    use 'neovim/nvim-lspconfig'                     -- easy nvim lsp setup
    use 'williamboman/nvim-lsp-installer'           -- to install lsp servers easily
    use {
        'nvim-treesitter/nvim-treesitter',          -- treesitter
        run = ':TSUpdate'
    }
    use 'jpalardy/vim-slime'                        -- slime (like in emacs)
    use 'mattn/emmet-vim'                           -- emmet (html)
    -- use 'tpope/vim-surround'                     -- surround (tpope)

    use 'catppuccin/nvim'                           -- [colorscheme] catppuccin
    -- use 'folke/tokyonight.nvim'                  -- [colorscheme] tokyonight
    -- use 'sainnhe/everforest'                     -- [colorscheme] everforest
    -- use 'andreasvc/vim-256noir'                  -- [colorscheme] 256noir
    -- use 'arcticicestudio/nord-vim'               -- [colorscheme] nord

    if packer_bootstrap then
        require('packer').sync()
      end
end,

---- floating window
config = {
    display = {
        open_fn = require('packer.util').float
    },
    profile = {
        enable = true,
        threshold = 0
    }
}})

---- auto source and packer sync on saving init.lua
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = "/home/nv/.config/nvim/lua/nv/addons/packer.lua",
--     command = { "PackerCompile", "PackerSync"}
--     group = vim.api.nvim_create_augroup("packer", { clear = true }),
-- })

