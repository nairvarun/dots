" settings
syntax on
filetype plugin indent on

"set number
set path+=**												" for recursive file search
set relativenumber
set nowrap
set tabstop=2
set shiftwidth=2
set ignorecase
set incsearch
set smartcase
set hlsearch
set ruler
set undofile
set wildmenu


" keymaps
let mapleader = ""										" ^[ == Alt/Meta. typed by going Ctrl+v + Alt<esc>

nnoremap v <C-v>
inoremap <leader>i <esc>
vnoremap <leader>i <esc>
cnoremap <leader>i <C-u><bs>

inoremap <leader>n <C-n>
inoremap <leader>p <C-p>

nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>- <C-w>_<C-w>\|
nnoremap <leader>= <C-w>=
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

nnoremap <leader>L gt
nnoremap <leader>H gT

" automatically source ~/.vimrc on :w
augroup vimrc
	autocmd!
	autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup end

