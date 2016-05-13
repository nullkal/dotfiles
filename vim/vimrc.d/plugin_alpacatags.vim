let g:alpaca_tags_config = {
\	'_' : '-R --sort=yes --languages=+Ruby --languages=-js,JavaScript',
\	'default' : '--languages=-css,scss,html,js,JavaScript',
\	'js' : '--languages=+js',
\	'-js' : '--languages=-js,JavaScript',
\	'vim' : '--languages=+Vim,vim',
\	'php' : '--languages=+php',
\	'-vim' : '--languages=-Vim,vim',
\	'-style': '--languages=-css,scss,js,JavaScript,html',
\	'scss' : '--languages=+scss --languages=-css',
\	'css' : '--languages=+css',
\	'java' : '--languages=+java $JAVA_HOME/src',
\	'ruby': '--languages=+Ruby',
\	'coffee': '--languages=+coffee',
\	'-coffee': '--languages=-coffee',
\	'bundle': '--languages=+Ruby',
\}

augroup AlpacaTags
	autocmd!
	if exists(':AlpacaTags')
		autocmd BufWritePost Gemfile AlpacaTagsBundle
		autocmd BufEnter * AlpacaTagsSet
		autocmd BufWritePost * AlpacaTagsUpdate
	endif
augroup END
