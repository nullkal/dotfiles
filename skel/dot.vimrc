let g:dotfiles_runtime_dir =
\   fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/../vim'
let &runtimepath .= ',' . g:dotfiles_runtime_dir

if has('vim_starting')
    set nocompatible
    let &runtimepath .=
\	    ',' . g:dotfiles_runtime_dir . '/bundle/neobundle.vim'
endif

filetype off

call neobundle#begin(g:dotfiles_runtime_dir . '/bundle')
NeoBundleFetch 'Shougo/neobundle.vim'

let s:plugin_list = g:dotfiles_runtime_dir . '/bundle-plugins.vim'
if neobundle#load_cache(s:plugin_list)
  exec 'source ' . s:plugin_list

  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on
runtime! vimrc.d/**/*.vim

NeoBundleCheck
