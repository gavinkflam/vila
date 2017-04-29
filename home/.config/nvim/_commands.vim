"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
command! -nargs=* -complete=file Ag Ack! -Q <q-args>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSpace
command Project CtrlSpace B
command Buffer CtrlSpace H
command Fuzzy CtrlSpace orO
command Workspace CtrlSpace W

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
command Tree NERDTreeFind

