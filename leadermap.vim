" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
let g:mapleader = ','

" basic {{
  " Edit file in current file folder
  nnoremap <silent> <leader>e :e <C-R>=expand('%:p:h').'/'<cr>
  " Reload vimrc file
  nnoremap <leader>rl :source ~/.vimrc<cr>
  " Search with grep
  nnoremap <leader>/ :Ag<SPACE>
  " remap <cr> when completing
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " generate doc
  nnoremap <silent> <leader>d :call <SID>GenDoc()<cr>
  " clean some dirty charactors
  nnoremap <silent> <leader>cl :<C-u>call <SID>Clean()<cr>
" }}

" content edit {{
  nnoremap <leader>au :!autoprefixer %<cr>
" }}

" setting switch {{
  " TODO switch foldcolumn
  nnoremap <leader>sc :setl spell!<cr>
  nnoremap <leader>ic :set ic!<cr>
  nnoremap <leader>hl :set hls!<cr>
  nnoremap <leader>hc :let @/ = ""<cr>
  nnoremap <leader>pt :set paste!<cr>
  nnoremap <leader>nu :call <SID>NumberToggle()<cr>
  nnoremap <leader>ag :call <SID>SwitchGrepCmd()<cr>
  nnoremap <leader>bg :call <SID>ToggleBackground()<cr>
" }}

" plugin {{
  " easy-motion improved
  nnoremap <leader>f \\f
  nnoremap <leader>F \\F
  " bbye
  nnoremap <leader>q :Bdelete<cr>
  " vim-test
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>ta :TestFile<CR>
  " vim-session
  nmap <leader>sl :OpenSession
  nmap <leader>ss :SaveSession
  nmap <leader>sr :call <SID>Restart()<cr>
  nmap <leader>sd :CloseSession<cr>
  " ultisnips
  noremap <leader>snip :UltiSnipsEdit<cr>
  " Gundo
  nnoremap <D-u> :GundoToggle<CR>
  " vim-shell
  nnoremap <Leader>o :Open<CR>
  imap <2-LeftMouse> <C-o>:Open<CR>
  nmap <2-LeftMouse> :Open<CR>
  " tern
  nnoremap <leader>tb :TernDocBrowse<cr>
  nnoremap <leader>tt :TernType<cr>
  nnoremap <leader>tf :TernDef<cr>
  nnoremap <leader>td :TernDoc<cr>
  nnoremap <leader>tp :TernDefPreview<cr>
  nnoremap <leader>tr :TernRename<cr>
  nnoremap <leader>ts :TernRefs<cr>
" }}

" grep by motion {{
vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<cr>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<cr>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  call g:Quickfix('ag', "-Q -s", word)
  let @@ = saved_unnamed_register
endfunction
" }}

" functions {{
function! s:ToggleBackground()
  if &background ==# 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

function! s:NumberToggle()
  if(&number == 1) | set nu! | set rnu! | else | set rnu | set nu | endif
endfunction

function! s:Restart()
  execute 'wa'
  execute 'RestartVim'
endfunction

" Simple clean utility
function! s:Clean()
  let ft = &filetype
  " replace tab with 2 space
  if index(['javascript', 'html', 'css', 'vim', 'php'], ft) != -1
    silent! execute "%s/\<tab>/  /g"
  endif
  " replace tailing comma
  if ft ==# 'javascript'
    silent! execute '%s/;$//'
    " line should not starts with [ or (
    silent! execute '%s/^\s*\zs\([\[(]\)/;\1/'
  endif
  " remove tailing white space
  silent! execute '%s/\s\+$//'
  " remove windows 
  silent! execute '%s/$//'
endfunction

" Switch between `ag` and `git grep`, `grepprg` is a wrapper command
" See https://gist.github.com/55a5246a5b218b9848dc
function! s:SwitchGrepCmd()
  if g:grep_using_git
    set grepprg=ag\ --vimgrep\ $*
    let g:grep_using_git = 0
    echohl Identifier | echon 'grep by ag' | echohl None
  else
    set grepprg=grepprg\ $*
    let g:grep_using_git = 1
    echohl Identifier | echon 'grep by git' | echohl None
  endif
endfunction

function! s:GenDoc()
  if &ft ==# 'javascript'
    exe "JsDoc"
  elseif &ft ==# 'css'
    let lines = ['/*', ' * ', ' */']
    exe "normal! j?{$\<cr>:noh\<cr>"
    let lnum = getpos('.')[1]
    call append(lnum - 1, lines)
    exe "normal! kk$"
    startinsert!
  elseif &ft ==# 'html'
    let lnum = getpos('.')[1]
    let ind = matchstr(getline('.'), '\v\s*')
    call append(lnum - 1, ind . '<!--  -->')
    exe "normal! k^Ell"
    startinsert
  endif
endfunction
" }}
