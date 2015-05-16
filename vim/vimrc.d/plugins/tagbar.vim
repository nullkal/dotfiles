let g:tagbar_compact = 1
let g:tagbar_width = 32

if has('gui_running') || $CLIENT_MODE
  autocmd BufEnter * nested :call tagbar#autoopen(0)
  let g:tagbar_autoclose = 0
else
  let g:tagbar_autoclose = 1
endif
