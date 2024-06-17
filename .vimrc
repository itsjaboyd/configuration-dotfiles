filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'KabbAmine/lazyList.vim'
call vundle#end()
filetype plugin indent on

set number relativenumber
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set showmatch
set incsearch
set shellslash
syntax on
set background=dark
set autoindent
set shiftwidth=4
set nocompatible
set wildmenu
set hlsearch
set lazyredraw
set showcmd
set backspace=indent,eol,start

filetype plugin on
" execute pathogen#infect()
let g:vimwiki_list = [{'path': '~/Notes/', 'syntax': 'markdown', 'ext': 'md'}]

" toggle between number and relative number
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Useful markdown functions for vim
function! BoldWord()
    silent execute "normal b"
    silent execute "normal i**"
    silent execute "normal e"
    silent execute "normal a**"
endfunction
command! Bold call BoldWord()

function! ItalicWord()
    silent execute "normal b"
    silent execute "normal i_"
    silent execute "normal e"
    silent execute "normal a_"
endfunction
command! Ital call ItalicWord()

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undo
endif

