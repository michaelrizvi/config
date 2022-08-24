set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'morhetz/gruvbox'
" Plugin 'chriskempson/base16'
" Plugin 'sts10/vim-pink-moon'
" Plugin 'sonph/onehalf', { 'rtp': 'vim' }
" Plugin 'NLKNguyen/papercolor-theme'

Plugin 'vim-syntastic/syntastic'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

" Syntax highlighting
syntax on

" Show matching brackets
set showmatch

" Show the location in file (# line)
set ruler

" Autotabs for certain code
set smarttab

" Keep the indentation for the next line
set autoindent

" For tab == 4 spaces
set tabstop=4 shiftwidth=4

" Show the number of lines
set number
" set rnu

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Syntastic plugin configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>

" Set airline/powerline symbols
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''

" Gruvbox theme
let g:gruvbox_italic=1
colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox'

" Vim-pink-moon theme
" colorscheme pink-moon
" set background=dark
" let g:airline_theme=pink-moon

" OneHalf theme
"syntax on
"set t_Co=256
"set cursorline
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'
"lightline
"let g:lightline = { 'colorscheme': 'onehalfdark' }

" PaperColor theme
"set t_Co=256
"set background=light
"colorscheme PaperColor
"set background=dark
"colorscheme PaperColor

" Set cursor color
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor

" Fix black line bug
let &t_ut=''

" Automatic bracket closing
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Remap Tab to indent 
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Set cursor to beam in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" Remove autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Visual guide for the 79 columns when writing Python
autocmd FileType python setlocal colorcolumn=79

" Visual guide for the 80 columns when writing Markdown
autocmd FileType markdown setlocal colorcolumn=80

" Set clipboard as default register
set clipboard=unnamed

" Remove newline when enter for autocomplete
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
