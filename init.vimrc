lcd <sfile>:h
nnoremap <buffer> <M-p> :<C-u>TmuxDo rake provision<CR>
nnoremap <buffer> <M-b> :<C-u>TmuxDo rake snap:back<CR>
nnoremap <buffer> <F5> :<C-u>TmuxDo rake provision<CR>
nnoremap <buffer> <S-F5> :<C-u>TmuxDo rake snap:back<CR>
nnoremap <buffer> <F6> :<C-u>Vagrant rake test<CR>
" set isk+=!,?
