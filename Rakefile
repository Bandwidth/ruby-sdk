require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'

  desc 'Run All Tests'
  RSpec::Core::RakeTask.new(:spec)

  desc 'Run Only Unit Tests'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = './spec/unit/**/*_spec.rb'
  end

  desc 'Run Only Smoke Tests'
  RSpec::Core::RakeTask.new(:smoke) do |t|
    t.pattern = './spec/smoke/*_spec.rb'
  end

  task default: :spec
rescue LoadError
  # no rspec available
end
