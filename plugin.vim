" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:

" vim-test {{
  let g:test#javascript#mocha#file_pattern = '\.js'
  let g:test#javascript#mocha#options = '-c'
  function! s:StartTest(cmd)
    execute 'ItermStartTab! ' . a:cmd . '| error-parser'
  endfunction

  let g:test#custom_strategies = {'start': function('s:StartTest')}
  let g:test#strategy = 'start'
" }}

" syntastic {{
  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_enable_balloons = 0
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_check_on_wq = 0
  let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": ["vim", "ruby", "php"],
      \ "passive_filetypes": ["javascript", "html"] }
  let g:syntastic_vim_checkers = ['vint']
" }}

" unite-session {{
  let g:unite_source_session_path = expand('~') . '/.vim/sessions'
  let g:unite_source_session_options = &sessionoptions
" }}

" gist-vim {{
  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 0
  let g:gist_show_privates = 1
" }}

" ultisnips {{
  let g:UltiSnipsExpandTrigger='<C-j>'
  let g:UltiSnipsJumpForwardTrigger='<C-j>'
  let g:UltiSnipsJumpBackwardTrigger='<C-k>'
  let g:UltiSnipsEditSplit='vertical'
" }}

" Netrw {{
  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" }}

" vim-notes {{
  let g:notes_directories = ['~/Documents/notes']
  let g:notes_title_sync = 'rename_file'
" }}

" vim-shell {{
  let g:shell_mappings_enabled = 0
" }}

" vim-gitgutter {{
  let g:gitgutter_max_signs = 999
" }}

" tern_for_vim {{
  let g:tern_show_argument_hints = 'on_hold'
  "let g:tern_show_signature_in_pum = 1
"}}

" emmet {{
  " https://raw.github.com/mattn/emmet-vim/master/TUTORIAL
  " <c-y>a Make anchor from URL
  " <c-y>A Make quoted text from URL
  let g:user_emmet_expandabbr_key = '<D-y>'
  let g:user_emmet_next_key = '<C-y>n'
  let g:user_emmet_prev_key = '<C-y>p'
  "内部全选
  let g:user_emmet_balancetaginward_key = '<C-y>i'
  let g:user_emmet_balancetagoutward_key = '<C-y>o'
  let g:user_emmet_mode='a'
" }}

" vim-run {{
let g:vim_run_command_map = {
  \'javascript': 'node',
  \}
" }}

" jsdoc settings {{
  let g:jsdoc_allow_input_prompt = 0
  let g:jsdoc_enable_es6 = 1
  let g:jsdoc_access_descriptions = 2
  let g:jsdoc_custom_args_hook = {
  \ 'callback\|cb': {
  \   'type': ' {Function} ',
  \   'description': 'Callback function'
  \ },
  \ 'n': {
  \   'type': ' {Number} '
  \ },
  \ 'arr': {
  \   'type': ' {Array} '
  \ },
  \ 'str': {
  \   'type': ' {String} '
  \ },
  \ 'el$': {
  \   'type': ' {Element} '
  \ },
  \ 'e': {
  \   'type': ' {Event} '
  \ },
  \ 'node': {
  \   'type': ' {Element} '
  \ },
  \ 'obj': {
  \   'type': ' {Object} '
  \ },
  \ 'fn': {
  \   'type': ' {Function} '
  \ },
  \ 'cb': {
  \   'type': ' {Function} '
  \ }
  \}
" }}

" easygit {{
  let g:easygit_enable_command = 1
  let g:easygit_auto_lcd = 1
"}}

" vim-iterm-start {{
  let g:iterm_start_growl_enable = 1
" }}

" html5.vim {{
  let g:html5_event_handler_attributes_complete = 0
  let g:html5_rdfa_attributes_complete = 0
  let g:html5_microdata_attributes_complete = 0
  let g:html5_aria_attributes_complete = 0
" }}

" fastfold {{
  let g:fastfold_savehook = 1
  let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
  let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
  let g:vimsyn_folding='af'
  let g:xml_syntax_folding = 1
" }}

" dash.vim {{
  let g:dash_map = {
  \ 'javascript': ['javascript', 'NodeJS'],
  \ 'html': ['html', 'svg'],
  \}
" }}
