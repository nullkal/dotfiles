set imdisable

let g:eskk#directory="$HOME/.eskk"
let g:eskk#dictionary={'path': "~/.eskk/skk-jisyo", 'encoding': "utf-8"}
let g:eskk#large_dictionary=
  \   {'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': "euc-jp"}

let g:eskk_debug=0
let g:eskk_egg_like_newline=1
let g:skk_revert_henkan_style="okuri"
let g:eskk_enable_completion=1

let g:eskk_no_default_mappings = 1
silent! imap <unique> <C-j> <Plug>(eskk:enable)
silent! cmap <unique> <C-j> <Plug>(eskk:enable)
silent! lmap <unique> <C-j> <Plug>(eskk:enable) 
