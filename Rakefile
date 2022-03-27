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

    values = data['values'].reject { |v| v['obsolete'] }
    counts = values.map { |v| v['name'] }.tally

    constants = {}

    for row in values
      out << "    # #{row['comment'].squeeze(' ').tr("\r", '').gsub("\n", ' ').strip}\n" if row['comment']
      out << "    # @format #{row['numeric']} #{row['format'].strip}\n" if row['format']

      name = row['name']
      if counts[name] > 1 and row['origin']
        name += '_' + row['origin'].gsub(/[^[:alnum:]]/, '_').gsub(/_{2,}/, '_').sub(/_$/, '').upcase
      end
      if constants[name]
        name += '_ALT'
        if constants[name]
          fail <<~MSG
            Couldn't derive a unique name for #{name}.
            Previous source: #{constants[name].inspect}
          MSG
        end
      end

      constants[name] = row

      out << "    #{name} = #{row['numeric'].to_sym.inspect}"
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

