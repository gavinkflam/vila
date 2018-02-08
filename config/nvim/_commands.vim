"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
command! -nargs=* -complete=file Ag Ack -Q <q-args>
command! -nargs=* -complete=file Agp Ack <args>

command! -nargs=* -complete=file AgAdd AckAdd -Q <q-args>
command! -nargs=* -complete=file AgpAdd AckAdd <args>

command! -nargs=* -complete=file LAg LAck -Q <q-args>
command! -nargs=* -complete=file LAgp LAck <args>

command! -nargs=* -complete=file LAgAdd LAckAdd -Q <q-args>
command! -nargs=* -complete=file LAgpAdd LAckAdd <args>

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
" Files

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
command! Gprevhunk GitGutterPrevHunk
command! Gnexthunk GitGutterNextHunk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim profile
command! Vreload source $MYVIMRC
command! Vedit edit $MYVIMRC
