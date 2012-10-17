Rake::Task[:default].clear
task :default => ['db:test:prepare', 'spec']