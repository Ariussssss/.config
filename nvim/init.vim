let mapleader=" "

noremap J 7j
noremap K 7k
noremap H 5h
noremap L 5l
noremap <C-a> 0
noremap <C-e> $

set number 
set showcmd
set wildmenu
set cursorline

map R :source $MYVIMRC<CR> 
map S :w<CR>
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>

" window manage
" map sl :set splitright<CR>:vsplit<CR>
" map sk :set nosplitright<CR>:vsplit<CR>
" map sh :set nosplitbelow<CR>:split<CR>
" map se :set splitbelow<CR>:split<CR>
map sj :close<CR>
map sk :set splitright<CR>:vsplit<CR>
map sl :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>t <F5>

inoremap jj <Esc>
inoremap hh <Esc>
inoremap hj <Esc>
inoremap jh <Esc>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map ; :

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

call plug#end()

" appearance
let g:airline_theme = 'deus'
let g:SnazzyTransparent = 1
colorscheme snazzy
" hi Normal guibg=#000000 guifg=#000000 ctermbg=white ctermfg=black
" hi Normal guibg=#202124 guifg=#f2f3f7

" undotree
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
  nmap <buffer> j <plug>UndotreeNextState
  nmap <buffer> k <plug>UndotreePreviousState
  nmap <buffer> J 5<plug>UndotreeNextState
  nmap <buffer> K 5<plug>UndotreePreviousState
endfunc

" coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gk', 'in')
  endif
endfunction

nnoremap <silent> gk :call ShowDocumentation()<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" git lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
" fzf settings
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" "Raw" version of ag; arguments directly passed to ag
"
" e.g.
"   " Search 'foo bar' in ~/projects
"   :Ag "foo bar" ~/projects
"
"   " Start in fullscreen mode
"   :Ag! "foo bar"
command! -bang -nargs=+ -complete=file Ag call fzf#vim#ag_raw(<q-args>, <bang>0)

" Raw version with preview
command! -bang -nargs=+ -complete=file Ag call fzf#vim#ag_raw(<q-args>, fzf#vim#with_preview(), <bang>0)


" AgIn: Start ag in the specified directory
"
" e.g.
"   :AgIn .. foo
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
  " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

nnoremap <leader>fl :Lines 
nnoremap <leader>fb :BLines 
nnoremap <leader>ff :Files 
nnoremap <leader>fg :GFiles 
nnoremap <leader>f? :GFiles? 
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fa :AgIn 
nnoremap <leader>fc :Commits

