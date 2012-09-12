set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Navigation
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Rykka/colorv.vim'

" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'itspriddle/vim-stripper'

" Automatic Helpers
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'

" Snippets
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'

" Language Additions
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'bbommarito/vim-slim'
Bundle 'nanki/treetop.vim'

" JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'

" Other Languages
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'hallison/vim-markdown'
Bundle 'groenewege/vim-less'

" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'
Bundle 'tomtom/tlib_vim'
Bundle 'mathml.vim'

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" turn on syntax highlighting
syntax on

if has('gui_running')
  set ts=2 sw=2 et
  colorscheme railscasts2

  set guioptions=egmrt
  call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

  if has('gui_macvim')
    " Custom Menlo font for Powerline
    " https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
    set guifont=Menlo\ for\ Powerline:h12

    " Remove this line if you don't want to install the custom patched font
    let g:Powerline_symbols = 'fancy'
    set macmeta
  endif

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
    colorscheme railscasts2
  else
    if $TERM == 'xterm'
      set term=xterm-256color
      colorscheme railscasts2
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

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#252525 ctermbg=4
