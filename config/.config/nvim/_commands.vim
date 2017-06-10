"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
command! -nargs=* -complete=file Ag Ack! -Q <q-args>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer
command! BClose bp|bd #

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
command! LNextError ALENextWrap
command! LPrevError ALEPreviousWrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
command! GPrevHunk GitGutterPrevHunk
command! GNextHunk GitGutterNextHunk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
command! Tree NERDTreeFind

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim profile
command! VReloadProfile source $MYVIMRC
command! VEditProfile edit $MYVIMRC
