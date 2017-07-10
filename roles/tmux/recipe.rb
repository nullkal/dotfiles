# frozen_string_literal: true

describe 'Inserting the loading script into .tmux.conf'
block_in_file File.join(@target_dir, '.tmux.conf'),
  block: <<TMUX_CONF
for f in `find #{File.join(__dir__, 'tmux.conf.d')} -name '*.tmux' -type f`; do . $f; done
TMUX_CONF
