require 'rspec/core/rake_task'

begin
  RSpec::Core::RakeTask.new(:spec) do |c|
    c.rspec_opts = %w(--color --format=doc --require spec_helper)
  end
rescue LoadError => e
  puts e.message
end
