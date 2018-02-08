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
" tmux
function! TmuxExecuteAtNextPane(payload)
  " Early exit if not in tmux session
  if $TMUX == ''
    echom 'You are not in a tmux session'
    return
  endif

  " Early exit if there is only one pane
  if system('tmux display-message -p -F "#{window_panes}"') == 1
    echom 'There is only one pane in the current window'
    return
  endif

  " Load argument into tmux buffer, then paste at next pane and send return
  silent! call system('tmux loadb -', a:payload)
  silent! call system('tmux pasteb -t +')
  silent! call system('tmux send-keys -t + C-m')
endfunction
command! -nargs=1 TmuxExecuteAtNextPane call TmuxExecuteAtNextPane(<f-args>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim profile
command! Vreload source $MYVIMRC
command! Vedit edit $MYVIMRC
