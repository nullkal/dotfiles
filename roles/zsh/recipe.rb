# frozen_string_literal: true

describe 'Inserting the loading script into .zshenv'
block_in_file File.join(env[:target_dir], '.zshenv'),
  block: <<ZSHENV
export PATH=#{env[:path].join(':')}:$PATH
. #{env[:fact_file]}
for f in `find #{File.join(__dir__, 'zshenv.d')} -name '*.zsh' -type f`; do . $f; done
ZSHENV

describe 'Inserting the loading script into .zshrc'
block_in_file File.join(env[:target_dir], '.zshrc'),
  block: <<ZSHRC
for f in `find #{File.join(__dir__, 'zshrc.d')} -name '*.zsh' -type f`; do . $f; done
ZSHRC
