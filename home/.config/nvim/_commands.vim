"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
command! -nargs=* -complete=file Ag Ack! -Q <q-args>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
command LNextError ALENextWrap
command LPrevError ALEPreviousWrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
command GPrevHunk GitGutterPrevHunk
command GNextHunk GitGutterNextHunk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
command Tree NERDTreeFind

