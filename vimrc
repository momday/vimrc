set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

colorscheme Tomorrow-Night

" This fixes the backspace not working in edit mode.
set backspace=indent,eol,start

" Set the color column at 90 characters
set colorcolumn=90

" Show the line number
set number

let mapleader="."
inoremap jk <esc>
inoremap kj <esc>

nnoremap ; :

nnoremap <tab> %
vnoremap <tab> %





" Reload this .vimrc file
nnoremap <leader>sv :source ~/.vimrc<CR>


set hidden
set history=100

" Some indents
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Remove the whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set hlsearch

" Cancel the highlight search
nnoremap <leader><space> :nohlsearch<CR>


set hidden
set history=1000

scriptencoding utf-8

" Let Vim use utf-8 internally, because many scripts require this, eg NerdTree
set encoding=utf-8
setglobal fileencoding=utf-8


" Always switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set history=1000                    " Store a ton of history (default is 20)

set backup                  " Backups are nice ...
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" set spell " Spell checking on
" set hidden        " Allow buffer switching without saving
" set autowrite     " Automatically write a file when leaving a modified buffer

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " case insensitive
set smartcase           " if there is a capital letter, then the search becomes sensitve
set gdefault            " no need to add the g option @ the end of the command
set showmatch


" Cursor
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Restore cursor to file position in previous editing session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" indents
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Show matching bracket
set showmatch

" Split navigation
nnoremap <C-K> <C-W><C-K>  " go up / original
nnoremap <C-J> <C-W><C-J>  " go down / original
nnoremap <C-H> <C-W><C-H>  " go left
nnoremap <C-L> <C-W><C-L>  " go down
"nnoremap <C-J> <C-W><C-H>  " go left
"nnoremap <C-K> <C-W><C-L>  " go right

set splitright
set splitbelow


" Tab
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" nnoremap th    : tabfirst<CR>
nnoremap tk    : tabnext<CR>
nnoremap <C-u> : tabnext<CR>
nnoremap <C-f> : tabnext<CR>
nnoremap tj    : tabprev<CR>
nnoremap <C-y> : tabprev<CR>
nnoremap <C-d> : tabprev<CR>
nnoremap tl    : tablast<CR>
nnoremap tf    : tabfirst<CR>
nnoremap tt    : tabedit<Space>
nnoremap tn    : tabnext<Space>
nnoremap tm    : tabm<Space>
nnoremap tc    : tabclose<CR>

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Buffer configs
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <silent> <leader>ll :ls<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>f :bn<CR>
nnoremap <leader>g :e#<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>
nnoremap <leader>6 :6b<CR>
nnoremap <leader>7 :7b<CR>
nnoremap <leader>8 :8b<CR>
nnoremap <leader>9 :9b<CR>
nnoremap <leader>0 :10b<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


" Mouse navigation
  set mouse=a
  set mousehide

" copy/paste
 if has('clipboard')
   if has('unnammedplus')       " When possible use + register for copy-paste
     set clipboard=unnnamedplus
   else                         " On mac and Windows, use * register for copy-paste
     set clipboard=unnamed
   endif
 endif

" tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" Jumping to the previous opened tab
let g:lasttab = 1
nmap <silent> <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()



" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <leader>= <C-w>=

" Map <leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zk zL
map zj zH



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'


Plugin 'tpope/vim-surround'
Plugin 'spf13/vim-autoclose'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'matchit.zip'

Plugin 'lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'


" All of your Plugins must be added before the following line
call vundle#end()            " reyquired
filetype plugin indent on    " required


" Plugins configuration

" nerdtree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"map <c-e> <Plug>NERDTreeTabsToggle<cr>
map <leader>nt :NERDTreeTabsToggle<cr>
"map <leader>e :NERDTreeFind<cr>
"nmap <leader>nt :nerdtreefind<cr>

let NERDTreeStatusline = 1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirmode=1
"let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1

"let NERDTreekeeptreeinnewtab=1
"let g:NERDTree_tabs_open_on_gui_startup=1

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" fugitive
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>bb :Gblame<cr>
nnoremap <silent> <leader>gl :GloG<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gr :Gread<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>ge :Gedit<cr>
" mnemonic _i_nteractive
nnoremap <silent> <leader>ga :git add -p %<cr>
nnoremap <silent> <leader>gg :signifytoggle<cr>


