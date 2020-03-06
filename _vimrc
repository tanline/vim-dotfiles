set nocompatible
set hidden

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'

"use <leader>ww
Plug 'wesQ3/vim-windowswap'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

"Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'

"Color schemes
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'bcicen/vim-vice'
Plug 'haishanh/night-owl.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'tyrannicaltoucan/vim-deep-space'

"Calling plug#end automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()
syntax on

" set mapleader
let mapleader=","

"Color Scheme
"""""""""""""
"set t_Co=256
"if has('gui_running')
"  set transparency=5
"endif
"set background=dark
"set termguicolors
colorscheme molokai
let g:molokai_original=1

let g:airline_theme='deep_space'

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
set redrawtime=10000

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

"Wildmenu settings (a bar to help with autcomplete of filenames)
""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*/tmp/*

"ctrlp settings
""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 100000
let g:ctrlp_arg_map = 1
let g:ctrlp_match_current_file = 1
let g:ctrlp_lazy_update = 1

"nerdtree settings
"""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

"ale settings
"""""""""""""""""""""
let g:ale_set_highlights = 0

" Show trailing whitespace as a red highlight
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

augroup HighlightWhitespace
  au!
  au BufWinEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhitespace /\s\+$/
  au BufWinLeave * call clearmatches()
augroup end

" Trim whitespace in files when writing to them
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
augroup AutoTrimWhitespace
  au!
  au FileType c,cpp,python,ruby,java au BufWritePre :call TrimWhiteSpace()
augroup end

" Do not replace item that has been pasted with item that was pasted over
" (e.g. do not change paste register with new value when pasting)
xnoremap p "_dP"
