set nocompatible

filetype off
filetype plugin indent off

"
" Setup vundle

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'nanotech/jellybeans.vim'
Bundle 'BufOnly.vim'
Bundle 'szw/vim-maximizer'
Bundle 'godlygeek/csapprox'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', { 'rtp': 'vim/' }
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-commentary'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'dockyard/vim-easydir'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'honza/dockerfile.vim'
Bundle 'noprompt/vim-yardoc'
Bundle 'leafgarland/typescript-vim'
Bundle 'fatih/vim-go'
Bundle 'scrooloose/syntastic'
Bundle 'rust-lang/rust.vim'
Bundle '907th/vim-auto-save'
Bundle '907th/vim-qfix'

"
" Appearance

syntax on

let g:jellybeans_overrides = {
\  'Folded': {
\    'guifg': 'a0a8b0', 'guibg': '151515',
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
\  },
\  'ColorColumn': {
\    'guifg': '', 'guibg': '101010',
\    'ctermfg': '', 'ctermbg': 'Black',
\    'attr': ''
\  },
\  'SpecialKey': {
\    'guifg': '333333', 'guibg': '151515',
\    'ctermfg': '', 'ctermbg': '',
\    'attr': ''
\  }
\}

if has('gui_running')
  colorscheme jellybeans
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guifont=Menlo\ Regular:h15
  set guicursor+=a:blinkon0
else
  colorscheme jellybeans.terminal
  set t_Co=256
end

"
" Settings

filetype plugin on
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
set listchars=tab:\ \ ,trail:.
set list
set colorcolumn=80
set splitright
set splitbelow

if has('gui_running')
  set cursorline
  set macmeta
end

"
" Indents

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

"
" Disable automatic comment insertion on new lines

autocmd FileType * setlocal
\ formatoptions-=c
\ formatoptions-=r
\ formatoptions-=o

"
" Plugins config

let g:netrw_banner = 0

if has('gui_running')
  let g:indent_guides_enable_on_vim_startup = 1
end

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
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](tmp|log|vendor[\/]bundle|run)$' }
let g:ctrlp_max_files = 0

let g:ackprg = 'ack -H --nocolor --nogroup --column --smart-case --follow --ignore-dir={log,tmp,vendor/bundle,db/dumps}'

let g:sparkupExecuteMapping = '<M-m>'
let g:sparkupNextMapping = '<M-,>'

let g:typescript_compiler_binary = './npm_exec tsc'

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_ruby_checkers = ["mri", "rubocop"]
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }

"
" Key mappings

nmap <Space> :

nmap <M-w> <Plug>(easymotion-w)
nmap <M-b> <Plug>(easymotion-b)
nmap <M-e> <Plug>(easymotion-e)
nmap <M-g> <Plug>(easymotion-ge)
nmap <M-f> <Plug>(easymotion-f)
nmap <M-h> <Plug>(easymotion-F)

nmap <M-v> <C-w>v
nmap <M-s> <C-w>s
nmap <M-c> <C-w>c
nmap <M-x> :bd<CR>
nmap <M-z> :MaximizerToggle<CR>

nmap <M-Right> <C-w><Right>
nmap <M-Left> <C-w><Left>
nmap <M-Up> <C-w><Up>
nmap <M-Down> <C-w><Down>

if has('gui_running')
  macmenu &File.Close key=<nop>
endif
nmap <D-w> :tabclose<CR>
nmap <S-D-Right> :tabnext<CR>
nmap <S-D-Left> :tabprev<CR>
nmap <D-}> :tabnext<CR>
nmap <D-{> :tabprev<CR>

map <D-Up> <C-y>
map <D-Down> <C-e>
imap <D-Up> <C-o><C-y>
imap <D-Down> <C-o><C-e>
nmap <S-Up> 15<C-y>
nmap <S-Down> 15<C-e>
vmap <S-Up> 15<C-y>
vmap <S-Down> 15<C-e>


nmap <S-Left> <<
nmap <S-Right> >>
imap <S-Left> <C-o><<
imap <S-Right> <C-o>>>

imap <M-Up> <Esc>O
imap <M-Down> <Esc>o

nmap <Backspace> i<Space><Esc>
nmap <S-Backspace> a<Space><Esc>

nmap <F1> :tabedit ~/.vimrc<CR>
nmap <F2> :tabedit ~/.gvimrc<CR>

nmap <silent> <F9> :call <SID>reset()<CR>
function! s:reset()
  exec 'tabnew'
  exec 'tabonly'
  exec 'silent BufOnly'
endfunction

nmap <M-.> 3<C-w>>
nmap <M-,> 3<C-w><
nmap <M-k> <C-w>-
nmap <M-j> <C-w>+

nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

nnoremap <C-j> i<CR><Space><BS><Esc>k$
nmap <D-CR> <C-j>
nmap <D-Backspace> <S-j>

nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap S S<Space><BS>

nnoremap zq zr
nnoremap zQ zR

noremap <expr> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <Home> <C-o><Home>
nmap <D-Left> <Home>
imap <D-Left> <C-o><Home>

vnoremap <silent> <M-r> y:@"<CR>
nnoremap <silent> <M-r> Vy:@"<CR>

nmap <silent> <M-1> :Explore<CR>
nmap <silent> <M-2> :BuffergatorOpen<CR>
nmap <silent> <M-3> :TagbarToggle<CR>
nmap <silent> <M-4> :QFix<CR>

nmap <silent> <M-\> gcc
vmap <silent> <M-\> gcc

nmap <silent> <M-]> :FixWhitespace<CR>

nmap <silent> <M-/> :call <SID>disableSelection()<CR>
function! s:disableSelection()
  exec "let @/ = ''"
endfunction

" Just map this for something unused
imap <M-.> <Plug>snipMateNextOrTrigger
smap <M-.> <Plug>snipMateNextOrTrigger

nmap <silent> <M-n> :call <SID>toggleLineNumbering()<CR>
function! s:toggleLineNumbering()
  if &relativenumber == 1
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

"
" Toggle quotes type \" <-> \'
" FIXME: This is not always work as expected

nmap <M-'> :call <SID>toggleQuotes()<CR>
function! s:toggleQuotes()
  let alt = { '"' : "'", "'" : '"' }
  let re = join(map(keys(alt), '"\\".v:val'))
  let w = matchstr(getline('.'), '\%' . col('.') . 'c[^' . re . ']*[' . re . ']')
  let q = w[-1:-1]
  if has_key(alt, q)
    exec 'normal cs' . q . alt[q]
  endif
endfunction

"
" Fix Ruby's hash-rocket syntax ":key =>" to "key:"

nmap <M-;> xEpldE

"
" Automatic completion + snippets key mappings

imap <expr> <CR> <SID>myCR()
imap <expr> <Tab> <SID>myTab()
imap <expr> <Up> <SID>myUp()
imap <expr> <Down> <SID>myDown()

function! s:myCR()
  return pumvisible() ? "\<C-y>" : "\<CR>\<Space>\<BS>"
endfunction

function! s:triggerSnippet()
  return "\<C-r>=snipMate#TriggerSnippet()\<CR>"
endfunction

function! s:myTab()
  " Clear SnipMate tab stops
  if exists('b:snip_state')
    call b:snip_state.remove()
  endif
  return pumvisible() ? "\<C-e>" :
\     <SID>snipMateCanBeExpanded() ? <SID>triggerSnippet() :
\       <SID>checkBackSpace() ?  "\<Tab>" :
\       <SID>autoCompleteFunction()
endfunction

function! s:autoCompleteFunction()
  if &ft == 'css' || &ft == 'sass' || &ft == 'scss'
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
  let snippets = map(snipMate#GetSnippetsForWordBelowCursor(word, 0), 'v:val[0]')
  let matches  = filter(snippets, "v:val =~# '\\V\\^" . escape(word, '\') . "\\$'")
  return len(matches) > 0
endfunction

"
" Close help window with 'q'

autocmd bufenter * call <SID>helpWindowMapping()
function! s:helpWindowMapping()
  if &buftype == 'help'
    exec 'map <buffer> <silent> q :q<CR>'
  endif
endfunction

"
" Show TODOs

command! Todo Ack! 'TODO|FIXME|NOTE'

"
" Run html2haml on selected text
" TODO: Rewrite to using online service

command! Html2haml :call <SID>Html2haml()
function! s:Html2haml()
  let html2haml = '~/.rvm/bin/html2haml --erb'
  let temp_file = '/tmp/vim_html2.haml'
  execute 'w !' . html2haml . ' > ' . temp_file
  execute 'pedit ' . temp_file
endfunction

"
" Open alternative (en <-> ru) translation file

command! I18next :call <SID>I18next()
nmap <M-i> <M-v><M-Right>:call <SID>I18next()<CR>
function! s:I18next()
  let cur = bufname('%')
  let alt = substitute(cur, '\<\(en\|ru\)\>', '\=submatch(1) == "en" ? "ru" : "en"', '')
  execute 'edit ' . alt
endfunction
