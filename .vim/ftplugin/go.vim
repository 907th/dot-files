nmap <silent> <buffer> <F6> :call GoBuild()<CR>
nmap <silent> <buffer> <F7> :call GoRun()<CR>
nmap <silent> <buffer> <F8> :call GoTest()<CR>

" Build current script
function! GoBuild()
  exe "!go build %"
endfunction

" Run current script
function! GoRun()
  exe "!go run %"
endfunction

" Test scripts
function! GoTest()
  " TODO: Run tests
endfunction
