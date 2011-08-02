lcd <sfile>:h
let g:localrc_filename = 'init.vimrc'
nnoremap <silent> <buffer> <M-p> :<C-u>call vimproc#system("rake provision")<CR>
nnoremap <silent> <buffer> <M-b> :<C-u>call vimproc#system("rake snap:back")<CR>

nnoremap <silent> <buffer> <F5> :<C-u>call vimproc#system("rake provision")<CR>
nnoremap <silent> <buffer> <S-F5> :<C-u>call vimproc#system("rake snap:back")<CR>
nnoremap <silent> <buffer> <F6> :<C-u>call vimproc#system("rake in:test")<CR>
