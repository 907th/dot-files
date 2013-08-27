set nocompatible

"
" Setup vundle

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'godlygeek/csapprox'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'inkarkat/nerdcommenter'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/snipmate.vim'
Bundle 'rstacruz/sparkup', { 'rtp': 'vim/' }
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rvm'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rdolgushin/QFixToggle'
Bundle '907th/vim-conque'
Bundle '907th/vim-auto-save'

"
" Coloring

let g:jellybeans_overrides = {
\ 'Folded': { 'guifg': 'a0a8b0', 'guibg': '171717', 'ctermfg': 'Black', 'ctermbg': '', 'attr': 'italic' },
\ 'rubyRegexpDelimiter': { 'guifg': 'dd0093', 'guibg': '', 'ctermfg': 'Magenta', 'ctermbg': '', 'attr': '' },
\ 'rubyRegexp': { 'guifg': 'fd20b3', 'guibg': '', 'ctermfg': 'Magenta', 'ctermbg': '', 'attr': '' },
\ 'rubyRegexpSpecial': { 'guifg': 'f470f3', 'guibg': '', 'ctermfg': 'Magenta', 'ctermbg': '', 'attr': '' }
\}
hi ColorColumn guibg='#121212'

"
" Main setup

syntax on

if has('gui_running')
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guifont=Monospace\ 14
  colorscheme jellybeans
else
  set t_Co=256
  colorscheme jellybeans-csapprox
end

filetype on
filetype plugin on

set autoindent
set autoread
set number
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
set foldlevelstart=1
set showcmd
set wildmenu
set wildmode=list:longest,full
set completeopt=menu
set nobackup
set nowritebackup
set noswapfile
set listchars=tab:>.,trail:.
set list
set colorcolumn=80

"
" Key mappings

nmap <Space> :

nmap <M-Right> <C-w><Right>
nmap <M-Left> <C-w><Left>
nmap <M-Up> <C-w><Up>
nmap <M-Down> <C-w><Down>

map <M-PageUp> <C-PageUp>
map <M-PageDown> <C-PageDown>

nmap <F2> :tabe<CR>
nmap <F3> :tabc<CR>
nmap <F10> :qa<CR>

nmap <M-.> 3<C-w>>
nmap <M-,> 3<C-w><
nmap <M-k> <C-w>-
nmap <M-j> <C-w>+

nmap <M-v> <C-w>v
nmap <M-s> <C-w>s
nmap <M-c> <C-w>c

map <M-y> "ay
map <M-p> "ap
map <M-d> "ad

nmap <M-z> :w<CR>
nmap <M-x> :bd<CR>

nnoremap o o<Space><BS>
nnoremap O O<Space><BS>
nnoremap S S<Space><BS>
inoremap <CR> <CR><Space><BS>
nnoremap zq zr
nnoremap zQ zR
nnoremap gn gi<Esc>l
nnoremap <C-j> i<CR><Space><BS><Esc>k$

noremap <expr> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <Home> <C-o><Home>

vnoremap <silent> <M-r> y:@"<CR>
nnoremap <silent> <M-r> Vy:@"<CR>

nnoremap <silent> <M-q> :BuffergatorOpen<CR>
nnoremap <silent> <M-t> :TagbarToggle<CR>
nnoremap <silent> <M-a> :NERDTreeToggle<CR>
nnoremap <silent> <M-o> :NERDTreeFind<CR>
nnoremap <silent> <M-/> :let @/ = ''<CR>

map <M-]> <plug>NERDCommenterToggle
map <silent> <M-[> :FixWhitespace<CR>

nnoremap <M-w> :call EasyMotion#WB(0,0)<CR>
nnoremap <M-b> :call EasyMotion#WB(0,1)<CR>
nnoremap <M-e> :call EasyMotion#E(0,0)<CR>
nnoremap <M-g> :call EasyMotion#E(0,1)<CR>
nnoremap <M-f> :call EasyMotion#F(0,0)<CR>
nnoremap <M-h> :call EasyMotion#F(0,1)<CR>

command! Todo Ack! 'TODO|FIXME|NOTE'
command! ConqueInteractive :call ConqueInteractive()
command! Html2haml :call Html2haml()

"
" Indents

set expandtab
set tabstop=2
set shiftwidth=2

"
" Filetypes

augroup filetypedetect
  au BufNewFile,BufRead *.jst.eco set filetype=html.eco
augroup end

"
" Plugins Setup

let NERDSpaceDelims = 1
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 30
let NERDTreeHighlightCursorline = 0
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksFile = $HOME . '/.vim/NERDTreeBookmarks'
let NERDTreeShowBookmarks = 0

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
let g:sparkupNextMapping = '<M-n>'


" run ConqueTerm with command specified in prompt
function! ConqueInteractive()
  call inputsave()
  let cmd = input('Enter command: ')
  call inputrestore()
  if cmd != ''
    exec 'ConqueTerm ' . cmd
  endif
endfunction

" run html2haml on selected text
function! Html2haml()
  let html2haml = '~/.rvm/bin/vim_html2haml --erb'
  let temp_file = '/tmp/vim_html2.haml'
  execute 'w !' . html2haml . ' > ' . temp_file
  execute 'pedit ' . temp_file
endfunction

