set nocompatible
set hidden
filetype off
filetype plugin indent off
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
filetype plugin indent on  "required for vundle
" set mapleader
let mapleader=","

"Vundle settings
""""""""""""""""
"see :h vundle for more details or wiki for FAQ
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"let Vundle manage Vundle (required)
Plugin 'gmarik/vundle'

"original repos on github
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'nathanaelkane/vim-indent-guides'

"non github repos
"Bundle 'git://git.wincent.com/command-t.git'

call vundle#end()

"Color Scheme
"""""""""""""
set t_Co=256
if has('gui_running')
    set transparency=5
endif
colorscheme molokai
let g:molokai_original = 1

syntax on "syntax highlighting
set lazyredraw
set showmode
set showmatch
set backspace=2 "equivalent to :set backspace=indent,eol,start
set showcmd
set incsearch "incremental Search
set hlsearch "highlighted Search
set ignorecase "ignore cases when searching
set title
set mouse=a
set ruler
set number
set scrolloff=10

"Tabs and Indenting
"""""""""""""""""""
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"Key Bindings
""""""""""""""
"Shortcut to _vimrc
nmap <silent> <leader>rc :sp $MYVIMRC<cr>
"Shortcut to open NERDTree
nmap <silent> <leader>nt :NERDTree<cr>
"Shortcut to clear highlighted words
nmap <silent> <leader>, :let @/ = ""<cr>

"vim-airline settings
"""""""""""""""""""""
let g:airline_powerline_fonts = 1

"syntastic settings
"""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let b:syntastic_mode = "passive"
let g:syntastic_mode_map = { "mode": "passive" }

"Highlight any text that goes over 80 characters in a line
""""""""""""""""""""""""""""""""""""""""""
highlight Overlength ctermbg=DarkRed ctermfg=white guibg=#592929
match Overlength /\%81v.\+/

" Show trailing whitespace as a red highlight
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre :call TrimWhiteSpace()
