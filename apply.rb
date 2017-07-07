#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.push(File.join(__dir__, 'lib'))

require 'dotfiles'
Dotfiles.apply(
  roles_dir: File.join(__dir__, 'roles'),
  roles: %w[common zsh tmux nvim git ssh],
  env: {
    target_dir: File.expand_path('~/')
  }
)
