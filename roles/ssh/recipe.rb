# frozen_string_literal: true

describe 'Ensuring the directory ~/.ssh exists'
ssh_dir = File.join(@target_dir, '.ssh')
Dir.mkdir(ssh_dir, 0700) unless File.exists?(ssh_dir)

describe 'Inserting preferences into .ssh/config'
block_in_file File.join(@target_dir, '.ssh', 'config'),
  block: File.read(File.join(__dir__, 'config'))
