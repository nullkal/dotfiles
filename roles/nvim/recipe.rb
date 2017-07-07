# frozen_string_literal: true

require 'fileutils'

describe 'Ensuring the directory ~/.config/nvim exists'
FileUtils.mkdir_p(File.join(env[:target_dir], '.config', 'nvim'))

describe 'Inserting the loading script into .init.vim'
block_in_file File.join(env[:target_dir], '.config', 'nvim', 'init.vim'),
  marker: ->(mark) { "\" #{mark} DOTFILES MANAGED BLOCK"  },
  block: <<INIT_VIM
let g:dotfiles_runtimepath = '#{__dir__}'
let &runtimepath .= ',' . g:dotfiles_runtimepath

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = g:dotfiles_runtimepath . '/dein.toml'
let s:toml_lazy_file = g:dotfiles_runtimepath . '/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file, s:toml_lazy_file])
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:toml_lazy_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

runtime! vimrc.d/**/*
if filereadable($VIM . '/init.local.vim')
  source $VIM . '/init.local.vim'
endif
INIT_VIM
