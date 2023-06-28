require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'

  desc 'Run All Tests'
  RSpec::Core::RakeTask.new(:spec)

  desc 'Run Only Unit Tests'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = './spec/api/**/*_spec.rb'
  end
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = './spec/models/**/*_spec.rb'
  end

  desc 'Run Only Integration Tests'
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = './spec/integration/*_spec.rb'
  end

  desc 'Run Only Client Unit Tests'
  RSpec::Core::RakeTask.new(:client) do |t|
    t.pattern = './spec/*_spec.rb'
  end

  task default: :spec
rescue LoadError
  # no rspec available
end
