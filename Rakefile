require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require_relative 'config/application'

ENV['RUBYOPT'] = '-W0'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

task default: [:spec, :rubocop]
