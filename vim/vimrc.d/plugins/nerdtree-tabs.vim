let g:nerdtree_tabs_smart_startup_focus=2

if has('gui_running') || $CLIENT_MODE
  let g:nerdtree_tabs_open_on_console_startup=1
else
  let g:nerdtree_tabs_open_on_console_startup=0
endif
