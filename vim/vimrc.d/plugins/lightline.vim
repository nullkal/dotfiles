let g:lightline = {
\ 'colorscheme': 'solarized_dark',
\ 'active': {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'fugitive', 'readonly', 'filename' ]
\   ],
\   'right': [
\     [ 'lineinfo', 'syntastic' ],
\     [ 'percent' ],
\     [ 'fileformat', 'fileencoding', 'filetype' ]
\   ]
\ },
\ 'component_function': {
\   'readonly': 'MyReadonly',
\   'modified': 'MyModified',
\   'filename': 'MyFilename',
\   'fugitive': 'MyFugitive',
\   'fileformat': 'MyFileformat',
\   'filetype': 'MyFiletype',
\   'fileencoding': 'MyFileencoding',
\   'mode': 'MyMode',
\ },
\ 'component_expand': {
\   'syntastic': 'SyntasticStatuslineFlag'
\ },
\ 'component_type': {
\   'syntastic': 'error'
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '|', 'right': '|' }
\}

function! MyModified()
  return &ft =~ 'help\|tagbar\|nerdtree\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|tagbar\|nerdtree\|gundo' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
\   (
\     &ft == 'unite' ? unite#get_status_string() : 
\     &ft == 'nerdtree' ? '' :
\     &ft == 'tagbar' ? '' :
\     '' != expand('%:t') ? expand('%:t') : '[No Name]'
\   ) . ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'tagbar\|nerdtree\|gundo' && exists("*fugitive#head")
    return fugitive#head()
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
