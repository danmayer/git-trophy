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
  puts "running agaisnt project"
  Stats.new.generate
  puts "done"
end
