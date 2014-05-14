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
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'dockyard/vim-easydir'
Bundle 'heartsentwined/vim-emblem'
Bundle 'nathanaelkane/vim-indent-guides'
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
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guifont=Monospace\ 14
  set guicursor+=a:blinkon0
else
  set t_Co=256
end

colorscheme jellybeans

"
" Main setup

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

map <C-Up> <C-y>
map <C-Down> <C-e>
nmap <silent> <C-Right> :call <SID>wordBoundariesMovement('right', 'normal')<CR>
nmap <silent> <C-Left> :call <SID>wordBoundariesMovement('left', 'normal')<CR>
vmap <silent> <C-Right> :call <SID>wordBoundariesMovement('right', 'visual')<CR>
vmap <silent> <C-Left> :call <SID>wordBoundariesMovement('left', 'visual')<CR>

imap <C-Up> <C-o><C-y>
imap <C-Down> <C-o><C-e>
imap <silent> <C-Right> <C-o>:call <SID>wordBoundariesMovement('right', 'insert')<CR>
imap <silent> <C-Left> <C-o>:call <SID>wordBoundariesMovement('left', 'insert')<CR>

function! s:charUnderCursor(offset)
  let c = col('.') - 1 + a:offset
  let l = getline('.')
  if c >= 0 && c < strlen(l)
    return l[c]
  else
    return ''
  end
endfunction

function! s:wordBoundariesMovement(dir, mode) range
  let s = @/
  if a:mode == 'visual'
    normal gv
  end
  if a:dir == 'left'
    call search('\<', 'bW')
  elseif a:dir == 'right'
    if a:mode == 'insert'
      call search('\>', 'W')
    else
      call search('.\>', 'W')
    endif
  endif
  let @/ = s
endfunction

imap <M-Left> <C-o><<
imap <M-Right> <C-o>>>
imap <M-Up> <Esc>O
imap <M-Down> <Esc>o

imap <S-Right> <C-o>E<Right>
imap <S-Left> <C-o>B

imap <M-Backspace> <C-d>

map <M-PageUp> <C-PageUp>
map <M-PageDown> <C-PageDown>

map <PageUp> 15<C-y>
map <PageDown> 15<C-e>

nmap <F1> :tabedit ~/.vimrc<CR>
nmap <F2> :tabe<CR>
nmap <F3> :tabc<CR>
nmap <silent> <F9> :call <SID>reset()<CR>
nmap <silent> <F10> :call <SID>quit()<CR>

function! s:reset()
  exec 'tabnew'
  exec 'tabonly'
  exec 'silent BufOnly'
endfunction

function! s:quit()
  try
    silent qa
  catch /E37:/
    echo 'Not all changes were saved! Quit (Y/n)? '
    let c = getchar()
    if c == 13 || c == 121 || c == 89  " <CR>, y, Y
      qa!
    endif
  endtry
endfunction

nmap <S-Left> <<
nmap <S-Right> >>

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

nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

nmap <C-CR> <C-j>
nmap <C-\> <S-j>

nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap S S<Space><BS>

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

nmap <M-w> <Plug>(easymotion-w)
nmap <M-b> <Plug>(easymotion-b)
nmap <M-e> <Plug>(easymotion-e)
nmap <M-g> <Plug>(easymotion-ge)
nmap <M-f> <Plug>(easymotion-f)
nmap <M-h> <Plug>(easymotion-F)

nmap <M-'> :call <SID>toggleBracketsType()<CR>
nmap <silent> <M-[> :call <SID>deleteBrackets()<CR>

function! s:toggleBracketsType()
  let brackets = {
    \'"' : "'",    "'" : '"',
    \"]" : '}',    "}" : ')',    ")" : ']'
  \}
  let re = join(map(keys(brackets), '"\\".v:val'))
  let w = matchstr(getline('.'), '\%' . col('.') . 'c[^' . re . ']*[' . re . ']')
  let q = w[-1:-1]
  echo q
  if has_key(brackets, q)
    exec 'normal f' . q
    exec 'normal cs' . q . brackets[q]
  endif
endfunction

function! s:deleteBrackets()
  " Find nearest bracket and destroy it
  let w = matchstr(getline('.'), '\%' . col('.') . "c[^]'\"\)}]*[]'\"\)}]")
  let q = w[-1:-1]
  if q == ')' || q == ']' || q == '}' || q == '"' || q == "'"
    exec 'normal ds' . q

    " ...and add space before if needed
    if s:charUnderCursor(-1) !~ '\s'
      exec "normal i\<Space>"
    endif
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
imap <expr> <C-Tab> <SID>myCtrlTab()
imap <expr> <Up> <SID>myUp()
imap <expr> <Down> <SID>myDown()

function! s:myCR()
  return pumvisible() ? "\<C-y>" : "\<CR>\<Space>\<BS>"
endfunction

function! s:triggerSnippet()
  return "\<C-r>=snipMate#TriggerSnippet()\<CR>"
endfunction

function! s:myTab()
  return pumvisible() ? "\<C-e>" :
\     <SID>snipMateCanBeExpanded() ? <SID>triggerSnippet() :
\       exists('b:snip_state') ? <SID>triggerSnippet() :
\         <SID>checkBackSpace() ?  "\<Tab>" :
\         <SID>autoCompleteFunction()
endfunction

function! s:myCtrlTab()
  if exists('b:snip_state')
    call b:snip_state.remove()
  endif
  return <SID>myTab()
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
" Indents

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

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

let g:indent_guides_enable_on_vim_startup = 1

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

let g:ackprg =
  \ "ack-grep -H --nocolor --nogroup --column --smart-case --follow --ignore-dir={log,tmp}"

let g:sparkupExecuteMapping = '<M-m>'
let g:sparkupNextMapping = '<M-,>'

imap <M-.> <Plug>snipMateNextOrTrigger
smap <M-.> <Plug>snipMateNextOrTrigger
