"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations for plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --hidden'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE

" Status line format
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Echo message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline

" Display statusline all the time
set laststatus=2

" Smarter tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

