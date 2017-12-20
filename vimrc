set nocompatible
set exrc
filetype off

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" UI Additions
Plug 'vim-airline/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Commands
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'skwp/greplace.vim'
Plug 'gorkunov/smartpairs.vim'

" Automatic Helpers
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'editorconfig/editorconfig-vim'

" Language Additions
" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'nanki/treetop.vim', { 'for': 'treetop' }

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'leshill/vim-json'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flowtype/vim-flow'

" Python
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja2' }

" Haskell
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

" Other Languages
Plug 'jnwhiteh/vim-golang', { 'for':  'go' }
Plug 'othree/html5.vim'
Plug 'ChrisYip/Better-CSS-Syntax-for-Vim'
Plug 'hallison/vim-markdown'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'chase/vim-ansible-yaml'
Plug 'jparise/vim-graphql'
Plug 'vim-scripts/mathml.vim', { 'for': 'mathml' }
Plug 'zah/nim.vim', { 'for': 'nim' }

" Libraries
Plug 'vim-scripts/L9'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tlib_vim'

call plug#end()

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" turn on syntax highlighting
syntax on

if has('gui_running')
  set ts=2 sw=2 et
  colorscheme palenight

  set guioptions=egmrt

  set guifont=Menlo:h12

  " Always show de signcolumn, so our buffers doesn't shift on errors
  autocmd BufRead,BufNewFile * setlocal signcolumn=yes
  autocmd FileType tagbar,nerdtree setlocal signcolumn=no

  if has('gui_gnome')
    set guifont=Monospace\ Bold\ 12
  endif

  if has('gui_win32') || has('gui_win32s')
    set guifont=Consolas:h12
    set enc=utf-8
  endif
else
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
    colorscheme palenight
  else
    if $TERM == 'xterm'
      set term=xterm-256color
      colorscheme palenight
    else
      colorscheme default
    endif
  endif
endif

" UI
set ruler          " Ruler on
set nu             " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set background=dark

" Behaviors
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables

" Text Format
set tabstop=2
set backspace=2  " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab

" Searching
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/vendor/ruby/*,*/.bundle/*,*/.sass-cache/*,*/.bin/*
set wildignore+=*/doc/*,*/.yardoc/*

" Visual
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" a tab should display as "  ", trailing whitespace as "."
set listchars=tab:\ \  " Indentended trailing whitespace
" show trailing spaces as dots
set listchars+=trail:.
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" Sounds
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" Mouse
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U
set backspace=indent,eol,start

" add some line space for easy reading
set linespace=4

" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR>

" CtrlP
" map to CtrlP finder
nnoremap <leader>t :CtrlP<CR>
" map to CtrlP buffer explorer
nnoremap <leader>b :CtrlPBuffer<cr>
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = '\v[\/](vendor\/ruby|node_modules|.log|.git|.hg|.svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

" Use tabs for Makefiles
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4

" Use 4 spaces for python code
autocmd FileType python setlocal tabstop=8 shiftwidth=4 softtabstop=4 foldmethod=syntax
" Allow triple quotes in python
autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
" Don't show .pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Integrate ALE with Airline
let g:airline#extensions#ale#enabled = 1

" GHC helpers
nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>

" Enable Flow typechecking
let g:javascript_plugin_flow = 1
