set nocompatible

filetype off
filetype plugin indent off

"
" Setup Go plugin

set rtp+=~/.go/misc/vim

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
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rvm'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'dockyard/vim-easydir'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'honza/dockerfile.vim'
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

if !has('gui_running')
  set t_Co=256
  colorscheme jellybeans.terminal
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
set listchars=tab:>.,trail:.
set list
set colorcolumn=80
set cursorline
set splitright
set splitbelow
set macmeta

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
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](tmp|log|vendor[\/]bundle)$' }
let g:ctrlp_max_files = 0

let g:ackprg = "ack -H --nocolor --nogroup --column --smart-case --follow --ignore-dir={log,tmp,vendor/bundle}"

let g:sparkupExecuteMapping = '<M-m>'
let g:sparkupNextMapping = '<M-,>'
