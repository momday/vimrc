set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Bright

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

" close off the quickfix window"
nnoremap <leader>cq :ccl<CR>
nnoremap <leader>oq :cope<CR>

nnoremap <leader>d :JsDoc<CR>

" Reload this .vimrc file
nnoremap <leader>sv :source ~/.vimrc<CR>


" nnoremap <leader>t :CommandT<CR>
" For some reason, <leader>t is slow to trigger
nnoremap <C-t> :CommandT<CR>
" let g:CommandTTraverseSCM=

" ack remap
" cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>


" neovim terminal mapping
" enter in insert mode
" autocmd BufWinEnter,WinEnter term://* startinsert

nnoremap <leader>ht :Term<CR>
nnoremap <leader>vt :VTerm<CR>


" noremap <C-\> <C-\><C-n>
" noremap <C-\><C-\> <C-\><C-n>:q<CR>
" Getting out of the terminal to the last focused window
" :tnoremap <C-\> <C-\><C-n><C-w><C-p>
:tnoremap <C-\> <C-\><C-n>
" Closing the terminal window
:tnoremap <C-e><C-e> <C-\><C-n>:q<CR>


set hidden
set history=1000

" Some indents
filetype indent on
set nowrap
set shiftwidth=4
set smartindent
set autoindent

" Remove the whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set hlsearch

" Cancel the highlight search
nnoremap <leader><space> :nohlsearch<CR>


scriptencoding utf-8

" Let Vim use utf-8 internally, because many scripts require this, eg NerdTree
set encoding=utf-8
setglobal fileencoding=utf-8


" Always switch to the current file directory
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

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

let g:session_autoload = 'no'
let g:session_autosave = 'yes'



" Show matching bracket
set showmatch

" Split navigation
nnoremap <C-K> <C-W><C-K>  " go up / original
nnoremap <C-J> <C-W><C-J>  " go down / original
nnoremap <C-H> <C-W><C-H>  " go left
nnoremap <C-L> <C-W><C-L>  " go down
nnoremap <C-P> <C-W><C-P>  " go down

"nnoremap <C-J> <C-W><C-H>  " go left
"nnoremap <C-K> <C-W><C-L>  " go right

set splitright
set splitbelow


" Tab
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" nnoremap th    : tabfirst<CR>
nnoremap fk    : tabnext<CR>
" nnoremap <C-d> : tabnext<CR>
nnoremap fj    : tabprev<CR>
" nnoremap <C-s> : tabprev<CR>
nnoremap fl    : tablast<CR>
nnoremap ff    : tabfirst<CR>
nnoremap fe    : tabedit<Space>
nnoremap fn    : tabnext<Space>
nnoremap fm    : tabm<Space>
nnoremap fc    : tabclose<CR>

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
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing

" Jumping to the previous opened tab
let g:lasttab = 1
" nmap <silent> <leader>tl :exe "tabn ".g:lasttab<CR>
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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'


Plugin 'tpope/vim-surround'
Plugin 'spf13/vim-autoclose'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'matchit.zip'

Plugin 'lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'

Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'mattn/emmet-vim'
Plugin 'honza/vim-snippets'
Plugin 'sirver/ultisnips'
Plugin 'valloric/youcompleteme' "cf https://github.com/Valloric/YouCompleteMe/blob/master/README.md#mac-os-x
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'w0rp/ale'
Plugin 'prettier/prettier'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'thaerkh/vim-indentguides'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'mileszs/ack.vim'
Plugin 'mklabs/split-term.vim'
Plugin 'heavenshell/vim-jsdoc'
" Plugin 'elzr/vim-json'


" Plugin 'Shougo/deoplete.nvim'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'carlitux/deoplete-ternjs'
" Plugin 'marijnh/tern_for_vim'

" Plugin 'thaerkh/vim-workspace'

" All of your Plugins must be added before the following line
call vundle#end()            " reyquired
filetype plugin indent on    " required


" Plugins configuration

" jsx
let g:jsx_ext_required = 0 " jsx highlight appears also in regular JS file

" snippet "

" nerdtree
" Start NERDTree
autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
" close vim even NerdTree is the last window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
map <leader>nt :NERDTreeTabsToggle<cr>
map <leader>nf :NERDTreeFind<cr>
" Focus back on NERDTree.
map <leader>na :NERDTreeFocus<CR>

" Auto-refresh
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
let NERDTreeStatusline = 1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirmode=1
" let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1

" Closing NERDTree when exiting vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
"       \ && b:NERDTreeType == "primary") | qq | endif

" let NERDTreekeeptreeinnewtab=1
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
" nnoremap <silent> <leader>ga :git add -p %<cr>
" nnoremap <silent> <leader>gg :signifytoggle<cr>

" Snippet
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" emmet
let g:user_emmet_leader_key='<c-f>'
" let g:user_emet_compact_bool=1
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" workspace
nnoremap <leader>ss :ToggleWorkspace<CR>
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave = 1
let g:workspace_autosave_ignore = ['gitcommit', 'nerdtree']

" ale
" let g:ale_fixers = {}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
" let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
nmap <silent> ek :ALENext<cr>
nmap <silent> ej :ALEPrevious<cr>

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1


let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0


" let g:ale_sign_error = '●' " Less aggressive than the default '>>'
" let g:ale_sign_warning = '.'
" let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" prettier
" let g:prettier#exec_cmd_async
" Run Prettier after each save
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


" indentguides
let g:indentguides_ignorelist = ['text']

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }


" Use deoplete.
let g:deoplete#enable_at_startup = 1
" set pyxversion=3


let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]



" let g:deoplete#sources#ternjs#tern_bin = '/usr/local/Cellar/node/9.5.0/bin/'
" let g:deoplete#sources#ternjs#tern_bin = '/Users/kaneoh/.vim/bundle/tern_for_vim/node_modules/tern/bin'

let g:deoplete#sources#ternjs#timeout = 1

call plug#begin()
" " post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif


" " Initialize plugin system
call plug#end()

function! MyVimEnter()
  if argc() == 0
      OpenSession

      normal <y>
  endif
endfunction
au VimEnter * call MyVimEnter()

