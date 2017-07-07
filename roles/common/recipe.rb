# frozen_string_literal: true

describe 'Registering bin directory'
env[:path] ||= []
env[:path] << File.join(__dir__, 'bin')

load_recipe 'gather_facts.rb'
