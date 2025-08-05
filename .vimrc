set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'KabbAmine/lazyList.vim'
    Plugin 'vim-autoformat/vim-autoformat'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'romainl/vim-cool'
    Plugin 'rstacruz/vim-closer'
    Plugin 'tpope/vim-fugitive'
    Plugin 'preservim/nerdtree'
    Plugin 'vimwiki/vimwiki'
call vundle#end()
filetype plugin indent on

syntax on
set number norelativenumber
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set showmatch
set incsearch
set shellslash
set background=dark
set autoindent
set shiftwidth=4
set nocompatible
set wildmenu
set hlsearch
set lazyredraw
set showcmd
set textwidth=80
set backspace=indent,eol,start
set clipboard=unnamed

" Useful user-defined functions

" toggle between number and relative number
function ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
command! ToggleNumber call ToggleNumber()

" Useful markdown functions for vim
function BoldWord()
    silent execute "normal b"
    silent execute "normal i**"
    silent execute "normal e"
    silent execute "normal a**"
endfunction
command! Bold call BoldWord()

function ItalicWord()
    silent execute "normal b"
    silent execute "normal i_"
    silent execute "normal e"
    silent execute "normal a_"
endfunction
command! Ital call ItalicWord()

function FormatJson()
    silent execute "%!python3 -m json.tool"
endfunction
command! FormatJson call FormatJson()
nnoremap <leader>fj :FormatJson<CR>

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim/undo
endif

" Plugin settings configured on startup

" Plugin 'vimwiki/vimwiki'
function OpenObsidian()
    silent execute "!open 'obsidian://open?vault=Notes&file=" . expand('%:r') . "'"
    silent execute "redraw!"
endfunction
command! IO call OpenObsidian()
nnoremap <leader>io :IO<CR>

let g:vimwiki_list = [{'path': '~/Notes/', 'syntax': 'markdown', 'ext': 'md'}]

" Plugin 'vim-autoformat/vim-autoformat'
nnoremap <leader>af :Autoformat<CR>

" Plugin 'vim-airline/vim-airline'
let g:airline_theme='dark'

" Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

" Plugin 'romainl/vim-cool'
set hlsearch
let g:cool_total_matches = 1

" Plugin 'preservim/nerdtree'
let g:NERDTreeFileLines = 1
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
