colorscheme jellybeans

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Menlo\ Regular:h15
set guicursor+=a:blinkon0

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

macmenu &File.Close key=<nop>
nmap <D-w> :tabclose<CR>
nmap <S-D-Right> :tabnext<CR>
nmap <S-D-Left> :tabprev<CR>

map <D-Up> <C-y>
map <D-Down> <C-e>
imap <D-Up> <C-o><C-y>
imap <D-Down> <C-o><C-e>

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
nmap <C-CR> <C-j>
nmap <C-\> <S-j>

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

nmap <silent> <M-\> <plug>NERDCommenterToggle
vmap <silent> <M-\> <plug>NERDCommenterToggle

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
" TODO: This is not always work as expected

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
