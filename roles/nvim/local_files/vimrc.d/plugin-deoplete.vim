let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\   "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

let g:neosnippet#snippets_directory=g:dotfiles_runtimepath.'/snippets/'

imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\	"\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\	"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
	set conceallevel=2 concealcursor=niv
endif
