

#Fichero de Rakefile para Guard

$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

