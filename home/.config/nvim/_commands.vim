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
" CtrlSpace
command Project CtrlSpace B
command Buffer CtrlSpace H
command Fuzzy CtrlSpace orO
command Workspace CtrlSpace W

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
command GPrevHunk GitGutterPrevHunk
command GNextHunk GitGutterNextHunk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
command Tree NERDTreeFind

