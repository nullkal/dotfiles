# frozen_string_literal: true

class Dotfiles
  class EvalContext
    DEFAULT_MARKER = ->(mark) { "# #{mark} DOTFILES MANAGED BLOCK" }

    def initialize(env:)
      env.each { |k, v| eval "@#{k} = v" }
    end

    def describe(message)
      $stderr.puts " - #{message}"
    end

    def load_recipe(path)
      caller_file = caller(1, 1).first.split(/:\d/, 2).first
      if /\A\((.*)\)/ =~ caller_file
        raise LoadError, "require_relative is called in #{Regexp.last_match[1]}"
      end

      file = File.expand_path(path, File.dirname(caller_file))
      instance_eval(File.read(file), file, 1)
    end

    def block_in_file(path, block:, marker: DEFAULT_MARKER)
      begin_marker = marker.call('BEGIN')
      block += "\n" unless block.end_with?("\n")
      end_marker = marker.call('END')
      block_with_markers = "#{begin_marker}\n#{block}#{end_marker}\n"
      open(path, File::RDWR | File::CREAT) do |f|
        f.flock(File::LOCK_EX)
        state = 0
        replaced = String.new
        f.each_line do |line|
          case state
          when 0
            if line.chomp == begin_marker
              state = 1
            else
              replaced << line
            end
          when 1
            if line.chomp == end_marker
              replaced << block_with_markers
              state = 2
            end
          when 2
            replaced << line
          else
            raise 'Invalid state'
          end
        end
        case state
        when 0
          replaced << block_with_markers
        when 1
          raise "The end marker is missing in `#{path}`."
        end
        f.truncate(0)
        f.seek(0)
        f.puts(replaced)
      end
    end
  end
end
