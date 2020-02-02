" > git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" and then copy over the vimrc :D
set nocompatible 
filetype plugin indent on
au BufNewFile,BufRead *.fold set filetype=javascript
au BufNewFile,BufRead *.coffee set filetype=javascript

"if has("autocmd")
"  augroup templates
"    autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
"  augroup END
"endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'rafi/awesome-vim-colorschemes'
Bundle 'craigemery/vim-autotag'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'christoomey/vim-tmux-navigator'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'

let g:tex_flavor='latex'
let g:Tex_ViewRule_dvi = 'okular' 
let g:tmux_navigator_no_mappings = 1
set tags=./tags;,tags;

syntax enable
set spell spelllang=en_us
set background=dark
colorscheme deus
hi Normal ctermbg=none

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
vmap nn <Esc>
set pastetoggle=vv




