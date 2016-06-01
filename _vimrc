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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'

"original repos on github
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tomasr/molokai'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-rails'

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

"lightline settings
"""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

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
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

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

"Wildmenu settings (a bar to help with autcomplete of filenames)
""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:longest,full
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png

autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre :call TrimWhiteSpace()
