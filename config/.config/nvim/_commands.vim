"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
command! -nargs=* -complete=file Ag Ack! -Q <q-args>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer
command! Bclose bp|bd #

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
command! Lnexterror ALENextWrap
command! Lpreverror ALEPreviousWrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
command! Gprevhunk GitGutterPrevHunk
command! Gnexthunk GitGutterNextHunk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
command! Tfocus NERDTreeFind

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim profile
command! Vreload source $MYVIMRC
command! Vedit edit $MYVIMRC
