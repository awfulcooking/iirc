$: << __dir__ + '/../lib'
require "iirc"

def Object.const_missing(name)
  if name == :DATA
    read_data
  else
    super
  end
end

def read_data
  require 'stringio'
  StringIO.new File.read(caller(2).first.split(":").first).split("__END__", 2).last
end

require_relative "greeter"
require_relative "sed"
require_relative "wolfram"

class CoolBot < IIRC::IRCv3Bot
  include IIRC::Batteries
  include IIRC::PrintIO

  def autojoin_channels
    ['##iirc']
  end
end

IIRC.cli << Greeter
IIRC.cli << SedBot
IIRC.cli << Wolfram
IIRC.cli << CoolBot
