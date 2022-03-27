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

task :numerics do
  require 'yaml'
  require 'open-uri'

  data = YAML.load URI.open('https://raw.githubusercontent.com/ircdocs/irc-defs/gh-pages/_data/numerics.yaml')
  revision = data['file']['revision']

  puts "Loaded numerics.yaml revision #{revision}"

  open(File.join(__dir__, 'lib/iirc/numerics.rb'), 'w+') do |out|
    out << <<~HEADER
      module IIRC
        # Definitions imported from ircdocs.horse
        # @version #{revision}
        # @see https://raw.githubusercontent.com/ircdocs/irc-defs/gh-pages/_data/numerics.yaml
        # @see https://defs.ircdocs.horse/defs/numerics.html
        module Numerics
    HEADER

    for row in data['values']
      if row['comment']
        out << "    # #{row['comment'].squeeze(' ').tr("\r", '').gsub("\n", ' ').strip}\n"
      end
      if row['format']
        out << "    # @format #{row['numeric']} #{row['format'].strip}\n"
      end
      out << "    #{row['name']} = #{row['numeric'].to_sym.inspect}"
      out << "\n"
    end

    out << <<~FOOTER
        end
      end
    FOOTER
  end

  puts "%d numerics." % data['values'].count
  system('wc', File.join(__dir__, 'lib/iirc/numerics.rb'))
end

task default: :test

