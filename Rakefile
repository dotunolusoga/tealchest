# Add your own tasks in files placed in lib/tasks ending in .rake

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new services: 'test:prepare' do |t|
    t.libs << 'test'
    t.pattern = 'spec/services/**/*_spec.rb'
  end
end

Rake::Task[:test].enhance { Rake::Test['test:services'].invoke }
