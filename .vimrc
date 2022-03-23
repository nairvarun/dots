" settings
syntax on
filetype plugin indent on

set path+=**

"set number
set relativenumber
set nowrap
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set hlsearch
set ruler
set undofile
set wildmenu


" keymaps
let mapleader = " "

nnoremap v <C-v>
inoremap i <esc>
vnoremap i <esc>
cnoremap i <C-u><bs>


" automatically source ~/.vimrc on :w
augroup vimrc
	autocmd!
	autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup end

