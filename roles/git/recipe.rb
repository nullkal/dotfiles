# frozen_string_literal: true

describe 'Inserting the loading config into .gitconfig'
block_in_file File.join(env[:target_dir], '.gitconfig'),
  block: <<GITCONFIG
[include]
  path = #{File.join(__dir__, 'gitconfig')}
GITCONFIG

describe 'Inserting preferences into .gitignore'
block_in_file File.join(env[:target_dir], '.gitignore'),
  block: File.read(File.join(__dir__, 'gitignore'))
