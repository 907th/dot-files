set nocompatible

filetype off
filetype plugin indent off

"
" Setup Go plugins

set rtp+=~/.go/misc/vim

"
" Setup vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'BufOnly.vim'
Bundle 'godlygeek/csapprox'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'inkarkat/nerdcommenter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', { 'rtp': 'vim/' }
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rvm'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle '907th/vim-auto-save'
Bundle '907th/vim-qfix'

"
" Appearance

syntax on

let g:jellybeans_overrides = {
\  'Folded': {
\    'guifg': 'a0a8b0', 'guibg': '171717',
\    'ctermfg': 'Black', 'ctermbg': '',
\    'attr': 'italic'
\  },
\  'rubyRegexpDelimiter': {
\    'guifg': 'fd20b3', 'guibg': '',
\    'ctermfg': 'Magenta', 'ctermbg': '',
\    'attr': ''
\  },
\  'rubyRegexp': {
\    'guifg': 'ff40d3', 'guibg': '',
\    'ctermfg': 'Magenta', 'ctermbg': '',
\    'attr': ''
\  },
\  'rubyRegexpSpecial': {
\    'guifg': 'ff90ff', 'guibg': '',
\    'ctermfg': 'Magenta', 'ctermbg': '',
\    'attr': ''
\  }
\}

if has('gui_running')
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guifont=Monospace\ 14
  set guicursor+=a:blinkon0
else
  set t_Co=256
end

colorscheme jellybeans

hi ColorColumn guibg=#121212 ctermbg=Black

"
" Main setup

filetype plugin indent on

set autoindent
set autoread
set number
set relativenumber
set wrap
set hidden
set fileencoding=utf-8
set mouse=a
set mousehide
set backspace=2
set laststatus=2
set scrolloff=2
set sidescrolloff=4
set incsearch
set hlsearch
set ignorecase
set smartcase
set foldenable
set foldmethod=indent
set foldlevelstart=99
set showcmd
set wildmenu
set wildmode=list:longest
set completeopt=menuone,preview
set nobackup
set nowritebackup
set noswapfile
set listchars=tab:>.,trail:.
set list
set colorcolumn=80
set cursorline
set splitright
set splitbelow

"
" Key mappings

nmap <Space> :

nmap <M-Right> <C-w><Right>
nmap <M-Left> <C-w><Left>
nmap <M-Up> <C-w><Up>
nmap <M-Down> <C-w><Down>

map <M-PageUp> <C-PageUp>
map <M-PageDown> <C-PageDown>

map <PageUp> 15<C-y>
map <PageDown> 15<C-e>

nmap <F1> :tabedit ~/.vimrc<CR>
nmap <F2> :tabe<CR>
nmap <F3> :tabc<CR>
nmap <F9> :call <SID>reset()<CR>
nmap <F10> :qa<CR>

function! s:reset()
  exec 'tabnew'
  exec 'tabonly'
  exec 'silent! BufOnly'
endfunction

nmap <M-.> 3<C-w>>
nmap <M-,> 3<C-w><
nmap <M-k> <C-w>-
nmap <M-j> <C-w>+

nmap <M-v> <C-w>v
nmap <M-s> <C-w>s
nmap <M-c> <C-w>c
nmap <M-x> :bd<CR>
nmap <M-z> :w<CR>
nmap <M-q> <C-^>

nmap <M-a> "a
vmap <M-a> "a
nmap <M-=> "+
vmap <M-=> "+

nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap S S<Space><BS>

imap <M-Up> <Esc>O
imap <M-Down> <Esc>o
imap <M-Left> <C-o>B
imap <M-Right> <C-o>W

nmap <C-Up> <C-y>
nmap <C-Down> <C-e>

nnoremap zq zr
nnoremap zQ zR
nnoremap gn gi<Esc>l
nnoremap <C-j> i<CR><Space><BS><Esc>k$

noremap <expr> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <Home> <C-o><Home>

vnoremap <silent> <M-r> y:@"<CR>
nnoremap <silent> <M-r> Vy:@"<CR>

nmap <silent> <M-1> :Ex<CR>
nmap <silent> <M-2> :BuffergatorOpen<CR>
nmap <silent> <M-3> :TagbarToggle<CR>
nmap <silent> <M-4> :QFix<CR>

nmap <silent> <M-n> :call <SID>toggleLineNumbering()<CR>
nmap <silent> <M-/> :call <SID>disableSelection()<CR>
nmap <silent> <M-\> <plug>NERDCommenterToggle
vmap <silent> <M-\> <plug>NERDCommenterToggle
nmap <silent> <M-]> :FixWhitespace<CR>

function! s:disableSelection()
  exec "let @/ = ''"
endfunction

function! s:toggleLineNumbering()
  if &relativenumber == 1
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

nmap <M-w> :call EasyMotion#WB(0,0)<CR>
nmap <M-b> :call EasyMotion#WB(0,1)<CR>
nmap <M-e> :call EasyMotion#E(0,0)<CR>
nmap <M-g> :call EasyMotion#E(0,1)<CR>
nmap <M-f> :call EasyMotion#F(0,0)<CR>
nmap <M-h> :call EasyMotion#F(0,1)<CR>

nmap <M-'> :call <SID>toggleBracketsType()<CR>
nmap <M-[> :call <SID>deleteBrackets()<CR>

" TODO: Refactor to use dictionary
function! s:toggleBracketsType()
  let brackets = {
    \'"' : { 're': '"', 'to': "'" },
    \"'" : { 're': "'", 'to': '"' },
    \"[" : { 're': '\[', 'to': '}' },
    \"]" : { 're': '\]', 'to': '}' },
    \"{" : { 're': '{', 'to': ')' },
    \"}" : { 're': '}', 'to': ')' },
    \"(" : { 're': '(', 'to': ']' },
    \")" : { 're': ')', 'to': ']' }
  \}
  let w = matchstr(getline('.'), '\%' . col('.') . "c[^]'\")}]*[]'\")}]")
  let q = w[-1:-1]
  if q == "'"
    normal cs'"
  endif
  if q == '"'
    normal cs"'
  endif
  if q == ')'
    normal cs)]
  endif
  if q == ']'
    normal cs]}
  endif
  if q == '}'
    normal cs})
  endif
endfunction

" TODO: Add preceding space only when there is non-space character right before
function! s:deleteBrackets()
  let w = matchstr(getline('.'), '\%' . col('.') . "c[^]'\"\)}]*[]'\"\)}]")
  let q = w[-1:-1]
  if q == ')' || q == ']' || q == '}' || q == '"' || q == "'"
    exec 'normal ds' . q . "i\<Space>"
  endif
endfunction

"
" Show TODOs

command! Todo Ack! 'TODO|FIXME|NOTE'

"
" Run html2haml on selected text

command! Html2haml :call Html2haml()

function! Html2haml()
  let html2haml = '~/.rvm/bin/html2haml --erb'
  let temp_file = '/tmp/vim_html2.haml'
  execute 'w !' . html2haml . ' > ' . temp_file
  execute 'pedit ' . temp_file
endfunction

"
" Automatic completion + snippets key mappings

imap <expr> <CR> <SID>myCR()
imap <expr> <Tab> <SID>myTab()
imap <expr> <Up> <SID>myUp()
imap <expr> <Down> <SID>myDown()

function! s:myCR()
  return pumvisible() ? "\<C-y>" : "\<CR>\<Space>\<BS>"
endfunction

function! s:myTab()
  let triggerSnippet = "\<C-r>=snipMate#TriggerSnippet()\<CR>"
  return pumvisible() ? "\<C-n>" :
\     <SID>snipMateCanBeExpanded() ? triggerSnippet :
\       exists('b:snip_state') ? triggerSnippet :
\         <SID>checkBackSpace() ?  "\<Tab>" :
\         <SID>autoCompleteFunction()
endfunction

function! s:autoCompleteFunction()
  if &ft == 'css' || &ft == 'sass'
    return "\<C-x>\<C-o>"
  else
    return "\<C-n>"
  endif
endfunction

function! s:myUp()
  return pumvisible() ? "\<C-p>" : "\<Up>"
endfunction

function! s:myDown()
  return pumvisible() ? "\<C-n>" : "\<Down>"
endfunction

function! s:checkBackSpace()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:snipMateCanBeExpanded()
  let word     = snipMate#WordBelowCursor()
  let snippets = map(snipMate#GetSnippetsForWordBelowCursor(word, '*', 0), 'v:val[0]')
  let matches  = filter(snippets, "v:val =~# '\\V\\^" . escape(word, '\') . "\\$'")
  return len(matches) > 0
endfunction

"
" Indents

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

"
" Close help window with 'q'

autocmd bufenter * call <SID>helpWindowMapping()

function! s:helpWindowMapping()
  if &buftype == 'help'
    exec 'map <buffer> <silent> q :q<CR>'
  endif
endfunction

"
" Disable automatic comment insertion on new lines
autocmd FileType * setlocal
\ formatoptions-=c
\ formatoptions-=r
\ formatoptions-=o

"
" Other plugins

let g:netrw_banner = 0

let g:buffergator_autoexpand_on_split = 0
let g:buffergator_viewport_split_policy  = 'B'
let g:buffergator_split_size = 12
let g:buffergator_suppress_keymaps = 1
let g:buffergator_sort_regime = 'mru'
let g:buffergator_autodismiss_on_select = 1

let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_width = 35
let g:tagbar_left = 1
let g:tagbar_sort = 0

let g:EasyMotion_leader_key = '<Leader>f'

let g:ctrlp_switch_buffer = ''
let g:ctrlp_custom_ignore = '\v[\/]tmp$'
let g:ctrlp_max_files = 0

let g:sparkupExecuteMapping = '<M-m>'
" let g:sparkupNextMapping = '<M- >'
