set nocompatible
set hidden
filetype off
filetype plugin indent off
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
filetype plugin indent on  "required for vundle

"Color Scheme
"""""""""""""
set t_Co=256
if v:version > 703
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

"Status Line
"""""""""""""""""""
set statusline=%t
set statusline+=%m
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P
set statusline+=%{fugitive#statusline()}

"Line Numbers
"switches between relative and absolute depending on the mode that you're in
"originaly found at https://gist.github.com/3012145
"""""""""""""""""""

"Tabs and Indenting
"""""""""""""""""""
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"Key Bindings
""""""""""""""
"Shortcut to _vimrc
nmap <silent> ,rc :sp $MYVIMRC<cr>
"Shortcut to open NERDTree
nmap <silent> ,nt :NERDTree<cr>
"Shortcut to clear highlighted words
nmap <silent> ,, :let @/ = ""<cr>

"Vundle settings
""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"let Vundle manage Vundle (required)
Plugin 'gmarik/vundle'

"original repos on github
Plugin 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

"vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

"non github repos
"Bundle 'git://git.wincent.com/command-t.git'

"Brief help
":BundleList          - list configured bundles
":BundleInstall(!)    - install(update) bundles
":BundleSearch(!) foo - search(or refresh cache first) for foo
":BundleClean(!)      - confirm(or auto-approve) removal of unsused bundles
"see :h vundle for more details or wiki for FAQ

call vundle#end()

"
" Highlight any text that goes over 80 characters in a line
"highlight Overlength ctermbg=DarkRed ctermfg=white guibg=#592929
"match Overlength /\%81v.\+/


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