" Execute payload in the runner pane via the tmux buffer
function! vmux#tmux_execute_at_runner_pane(payload)
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

  " Load argument into tmux buffer, then paste at runner pane and send return
  silent! call system('tmux loadb -', a:payload)
  silent! call system('tmux pasteb -t +')
  silent! call system('tmux send-keys -t + C-m')
endfunction

" Get text under visual selection
" https://github.com/erig0/nc2xclip/blob/master/get_visual_selection.vim
function! vmux#get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 1]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" Command wrapper for runner pane execution
command! -nargs=1 VmuxExecuteAtRunnerPane call vmux#tmux_execute_at_runner_pane(<f-args>)

" Key mappings
inoremap <silent> <M-,> <C-O>:call vmux#tmux_execute_at_runner_pane(getline('.'))<CR>
nnoremap <silent> ,, :call vmux#tmux_execute_at_runner_pane(getline('.'))<CR>
vnoremap <silent> ,, :call vmux#tmux_execute_at_runner_pane(vmux#get_visual_selection())<CR>
