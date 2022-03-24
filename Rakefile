# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "rdoc/task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

RDoc::Task.new do |rd|
  rd.rdoc_files.include("lib/**/*.rb")
  rd.options = ["--all"]
end

task default: :test
