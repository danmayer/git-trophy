require 'rubygems'
require 'rake'
require './lib/stats'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end
task :default => :test

desc "Run trophies locally"
task :run do
  puts "running against project"
  project_dir = (ENV['TROPHY_DIR'] || `pwd`).strip

  logger   = Logger.new(STDOUT)
  log_level = (ENV['LOG_LEVEL'] || Logger::INFO).to_i
  logger.level = log_level
  
  Stats.new(:dir => project_dir, :logger => logger).generate
  puts "done"
end
