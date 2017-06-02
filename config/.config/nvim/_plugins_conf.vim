"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations for plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --hidden'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun.vim

" Asyncrun fugitive commands
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Display asyncrun status in airline status bar
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE

" Status line format
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Echo message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim

" Show hidden files
let g:ctrlp_show_hidden = 1

" Custom mappings
let g:ctrlp_prompt_mappings = {
    \ 'PrtClearCache()':      ['<c-r>'],
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete.vim

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Auto select first hint
set completeopt+=noinsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline

" Display statusline all the time
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized
