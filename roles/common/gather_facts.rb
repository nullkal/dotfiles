# frozen_string_literal: true

def write_fact(f, name, value)
  f.puts "export #{name}"
  f.puts "#{name}=#{value}"
end

describe "Registering fact file's path"
@fact_file = File.join(@target_dir, '.dotfiles.conf')

open(@fact_file, 'w') do |f|
  describe 'Gathering the fact: the version of `ls`'
  def detect_ls_type
    if system('ls --color -d . >/dev/null 2>&1')
      'GNU'
    elsif system('ls -G -d . >/dev/null 2>&1')
      'BSD'
    else
      'UNKNOWN'
    end
  end
  write_fact(f, 'LS_TYPE', detect_ls_type)
end
