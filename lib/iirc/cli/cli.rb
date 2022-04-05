# frozen_string_literal: true

require "set"

module IIRC
  class BotsScope < Module
    def initialize(cli)
      define_method(:method_missing) { |name, *args|
        cli.bots.find { _1.user&.nick&.downcase == name.to_s || _1.class&.name&.downcase == name.to_s } || super(name, *args)
      }
    end
  end

  class CLI
    require_relative "puts"

    attr_reader :args
    attr_reader :stdin, :stdout, :stderr

    def initialize(args=ARGV, stdin: $stdin, stdout: $stdout, stderr: $stderr)
      @args = args
      @stdin = stdin
      @stdout = stdout
      @stderr = stderr
      @specs = Set.new
    end

    def <<(desc)
      ensure_run_at_exit
      @specs << Array(desc)
    end

    def bots()
      @bots ||= Hash.new { |bots,spec| bots[spec] = construct(spec) }
      @specs.map { |spec| @bots[spec] }.freeze
    end

    def construct(spec)
      klass, *args = spec
      if IIRC::Bot >= klass and Hash === args.last and args.count == 1
        args.unshift nil
      end
      klass.new(*args).extend(Puts).extend(BotsScope.new(self))
    end

    def ensure_run_at_exit
      @at_exit ||= at_exit do
        run unless $! or dont?
      end
    end

    def run_bots
      bots.each { |bot|
        bot.socket = ::IIRC.dial('localhost', ssl_context: :no_verify)
        Thread.new {
          bot.register!
          bot.run
        }
      }
    end

    def run_console
      require 'pry'

      Puts.bottom!

      extend BotsScope.new(self)

      begin
        require 'pry'
        pry
      rescue LoadError
        require 'irb'
        binding.irb
      end
    end

    def run
      bots
      Puts.bottom! 0, 0, "\x1b[K"
      Puts.bottom! 2, 0, "\x1b[K"
      # Puts.bottom! 2, 0, Paint["[#{bots.count} bots]  ", :bright, :white] + " %s" % bots.map(&:puts_prefix).join("  ")

      case args.first
      when "run", nil
        # run_bots
        run_console
      when "console"
        run_console
      end
    end

    def dont!(dont=true) @dont = dont end
    def dont?() @dont end
  end

  module_function def cli(*args, **kwargs)
    bots = args.filter { Class === _1 }
    @@cli ||= CLI.new(*args-bots, **kwargs)
    for bot in bots
      @@cli << bot
    end
    @@cli
  end
end
