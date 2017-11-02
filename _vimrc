set nocompatible
set hidden

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-rails', { 'for': 'ruby' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'

"Color schemes
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'

"Calling plug#end automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()

" set mapleader
let mapleader=","

"Color Scheme
"""""""""""""
set t_Co=256
if has('gui_running')
    set transparency=5
endif
colorscheme molokai
let g:molokai_original=1

let g:airline_theme='wombat'

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

"nerdtree settings
"""""""""""""""""""""
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"close vim if nerdtree is the last window open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
"let b:syntastic_mode = "passive"
"let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_python_checkers = ['pylint']

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

" Do not replace item that has been pasted with item that was pasted over
" (e.g. do not change paste register with new value when pasting)
xnoremap p "_dP"

"Wildmenu settings (a bar to help with autcomplete of filenames)
""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png


autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre :call TrimWhiteSpace()
