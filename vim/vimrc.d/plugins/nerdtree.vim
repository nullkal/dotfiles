let g:NERDTreeMinimalUI=1
let g:NERDTreeMouseMode=2
let NERDTreeWinSize=40

if has('gui_running') || $CLIENT_MODE
  let NERDTreeQuitOnOpen = 0
else
  let NERDTreeQuitOnOpen = 1
endif
