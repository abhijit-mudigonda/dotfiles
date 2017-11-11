set nocompatible 
filetype plugin indent on
au BufNewFile,BufRead *.fold set filetype=javascript
au BufNewFile,BufRead *.coffee set filetype=javascript

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'craigemery/vim-autotag'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'LaTeX-Help'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'

let g:tex_flavor='latex'
let g:tmux_navigator_no_mappings = 1
set tags=./tags;,tags;

syntax enable
set background=dark
colorscheme solarized

nnoremap <silent> <S-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <S-j> :TmuxNavigateDown<cr>
nnoremap <silent> <S-k> :TmuxNavigateUp<cr>
nnoremap <silent> <S-l> :TmuxNavigateRight<cr>
nnoremap <silent> <S-/> :TmuxNavigatePrevious<cr>

set laststatus=2
set statusline=%-(%F%m%r%h%w%)\ %{&ff}/%Y/%{&encoding}\ %=%(@\%03.3b\ %Ll\ %l,%v\ (%p%%)%)

set tabstop=4
set shiftwidth=4
set expandtab
set shellslash
set grepprg=grep\ -nH\ $*

imap jj <Esc>
