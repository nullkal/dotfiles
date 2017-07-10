# frozen_string_literal: true

describe 'Registering bin directory'
@path ||= []
@path << File.join(__dir__, 'bin')

load_recipe 'gather_facts.rb'
