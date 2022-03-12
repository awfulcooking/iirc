module IIRC
  module Bot::IRCv3
    module Parsing
      autoload :IRCParser, 'ircparser'

      def parse(line)
        msg = IRCParser::Message.parse(line.chomp)

        Bot::Event.new.tap { |evt|
          evt.sender = IRCParser::RFCWireFormat.__stringify_prefix(msg.prefix) if msg.prefix
          evt.tags = msg.tags
          evt.verb = msg.command.downcase.to_sym
          evt.args = msg.parameters
        }
      end
    end
  end
end