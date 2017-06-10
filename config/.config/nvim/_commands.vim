"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
command! -nargs=* -complete=file Ag Ack! -Q <q-args>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer

" Close the current buffer and move to the previous one
command! Bclose bp|bd #

" Close other buffers except the current one
function! Bonly()
  try
    execute 'bp'
    while 1
      execute 'bp|bd #'
    endwhile
  catch
  endtry
endfunction

command! Bonly call Bonly()

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
command! Tclose NERDTreeClose

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim profile
command! Vreload source $MYVIMRC
command! Vedit edit $MYVIMRC
