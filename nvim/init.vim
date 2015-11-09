set nocompatible

" Vundle {{{

filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#begin('~/.config/nvim/bundle')

Bundle 'gmarik/Vundle.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jszakmeister/vim-togglecursor'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'BufOnly.vim'
Bundle 'szw/vim-maximizer'
Bundle 'godlygeek/csapprox'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'dahu/vim-fanfingtastic'
Bundle 'jiangmiao/auto-pairs'
Bundle 'rking/ag.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', { 'rtp': 'vim/' }
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tommcdo/vim-fubitive'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'dockyard/vim-easydir'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'honza/dockerfile.vim'
Bundle 'noprompt/vim-yardoc'
Bundle 'fatih/vim-go'
Bundle 'rust-lang/rust.vim'
Bundle 'mxw/vim-jsx'
Bundle '907th/vim-auto-save'
Bundle '907th/vim-qfix'

call vundle#end()

" }}}

" Main settings {{{

syntax on
colorscheme tomorrow_night_bright

filetype on
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
set listchars=tab:\ \ ,trail:.
set list
set colorcolumn=80
set splitright
set splitbelow
set cursorline

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0

autocmd FileType * setlocal
\ formatoptions-=c
\ formatoptions-=r
\ formatoptions-=o
" }}}

" Plugins config {{{

let g:netrw_banner = 0

let g:indent_guides_enable_on_vim_startup = 1

let g:buffergator_sort_regime = 'mru'
let g:buffergator_show_full_directory_path = 0
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_viewport_split_policy  = 'B'
let g:buffergator_split_size = 12
let g:buffergator_suppress_keymaps = 1

let g:tagbar_compact = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_width = 35
let g:tagbar_left = 1
let g:tagbar_sort = 0

let g:EasyMotion_leader_key = '<Leader>f'

let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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

let g:ft_improved_nohighlight = 1

let g:maximizer_set_default_mapping = 0
let g:maximizer_restore_on_winleave = 1

let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''

let g:auto_save_in_insert_mode = 0

" }}}

" Key mappings {{{

nmap <Space> :

nmap <Down> gj
nmap <Up> gk
vmap <Down> gj
vmap <Up> gk

nmap <M-w> <Plug>(easymotion-w)
nmap <M-b> <Plug>(easymotion-b)
nmap <M-e> <Plug>(easymotion-e)
nmap <M-g> <Plug>(easymotion-ge)
nmap <M-f> <Plug>(easymotion-f)
nmap <M-h> <Plug>(easymotion-F)

nmap <S-Up> 5<C-y>
nmap <S-Down> 5<C-e>
vmap <S-Up> 5<C-y>Û2MÛ2M
vmap <S-Down> 5<C-e>

imap <M-Up> <C-o>O
imap <M-Down> <C-o>o

nmap <Tab> O<Esc>
nmap <CR> o<Esc>

nmap <S-Left> <<
nmap <S-Right> >>
imap <S-Left> <C-o><<
imap <S-Right> <C-o>>>

nmap <Backspace> i<Space><Esc>
nmap <Del> a<Space><Esc>

nmap <M-.> 3<C-w>>
nmap <M-,> 3<C-w><
nmap <M-k> <C-w>-
nmap <M-j> <C-w>+

nnoremap <C-j> i<CR><Space><BS><Esc>k$
nmap <M-BS> J

nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap S S<Space><BS>

noremap <expr> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <Home> <C-o><Home>

nmap <C-Up> <C-y>
nmap <C-Down> <C-e>

nmap <S-Up> 20<C-y>
nmap <S-Down> 20<C-e>
imap <S-Up> <C-o>20<C-y>
imap <S-Down> <C-o>20<C-e>

nmap <silent> <F1> :help <C-r><C-w><CR>
nmap <silent> <F2> :Explore<CR>
nmap <silent> <F3> :BuffergatorToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>
nmap <silent> <F5> :QFix<CR>
nmap <silent> <F9> :tabnew<CR>:tabonly<CR>:BufOnly<CR>

nmap <M-]> :FixWhitespace<CR>
nmap <M-\> gcc
nmap <M-/> :let @/ = ''<CR>

nmap <Leader>t :tabnew<CR>
nmap <Leader>w :tabclose<CR>
nmap <C-Right> :tabnext<CR>
nmap <C-Left> :tabprev<CR>

nmap <M-Left> <C-w>h
nmap <M-Right> <C-w>l
nmap <M-Down> <C-w>j
nmap <M-Up> <C-w>k
nmap <M-c> <C-w>c
nmap <M-s> <C-w>s
nmap <M-v> <C-w>v
nmap <M-a> :w<CR>
nmap <M-x> :q<CR>
nmap <M-z> :MaximizerToggle!<CR>

nmap <M-p> :CtrlPLine<CR>

" }}}

" Tab autocompletion + snippets {{{

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

" }}}

" Commands {{{

command! Todo Ack! 'TODO|FIXME|NOTE'
command! Nvimrc :tabe ~/.config/nvim/init.vim

" }}}
