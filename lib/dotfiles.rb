# frozen_string_literal: true

class Dotfiles
  autoload :EvalContext, 'dotfiles/eval_context'

  class << self
    def apply(roles_dir:, roles: [], env:)
      dotfiles = Dotfiles.new(roles_dir: roles_dir, env: env)
      dotfiles.roles = roles
      dotfiles.apply
    end
  end

  attr_accessor :roles
  attr_reader :roles_dir

  def initialize(roles_dir:, env:)
    @roles_dir = roles_dir
    @context = EvalContext.new(env: env)
  end

  def apply
    roles.each do |role|
      $stderr.puts("\n# The role '#{role}'\n\n")
      @context.load_recipe(File.join(@roles_dir, role, 'recipe.rb'))
    end
  end
end
