require_relative "iirc/version"

require_relative "iirc/event"
require_relative "iirc/sender"
require_relative "iirc/user"

require_relative "iirc/bot"
require_relative "iirc/bot/ambient"
require_relative "iirc/bot/autojoin"
require_relative "iirc/bot/channels"
require_relative "iirc/bot/configure"
require_relative "iirc/bot/formatting"
require_relative "iirc/bot/hooks"
require_relative "iirc/bot/members"
require_relative "iirc/bot/oper_up"
require_relative "iirc/bot/parsing"
require_relative "iirc/bot/pong"
require_relative "iirc/bot/print_io"
require_relative "iirc/bot/reading"
require_relative "iirc/bot/redis"
require_relative "iirc/bot/regex_hooks"
require_relative "iirc/bot/track_own_nick"
require_relative "iirc/bot/verbs"

require_relative "iirc/bot/ircv3/caps"
require_relative "iirc/bot/ircv3/parsing"
require_relative "iirc/bot/ircv3/batches"
require_relative "iirc/bot/ircv3/labeled_requests"

module IIRC
  class Error < StandardError; end

  class Bot
    include Reading
    include Parsing
    include Hooks
    include Configure
    include Pong
    include TrackOwnNick
  end

  class IRCv3Bot < Bot
    include IRCv3::Parsing
    include IRCv3::Caps
    include IRCv3::Batches
    include IRCv3::LabeledRequests
  end

  class Batteries < IRCv3Bot
    include Bot::Channels
    include Bot::Members
    include Bot::Formatting
    include Bot::AutoJoin
    include Bot::Verbs
    include Bot::AmbientVerbs
  end

  module SSL
    module_function

    def default_context
      verify_peer_and_hostname
    end

    def verify_peer_and_hostname
      verify_peer.tap { |context|
        context.verify_hostname = true
      }
    end

    def verify_peer
      no_verify.tap { |context|
        context.verify_mode = OpenSSL::SSL::VERIFY_PEER
        context.cert_store = OpenSSL::X509::Store.new.tap(&:set_default_paths)
      }
    end

    def verify_hostname_only
      no_verify.tap { |context|
        context.verify_hostname = true
      }
    end

    def no_verify
      require 'openssl'
      OpenSSL::SSL::SSLContext.new
    end
  end

  module_function
    def dial(host, port=6697, ssl_context: SSL.default_context)
      require 'socket'

      Socket.tcp(host, port).then { |socket|
        if ssl_context
          OpenSSL::SSL::SSLSocket.new(socket, ssl_context).tap { |socket|
            socket.hostname = host
            socket.connect
          }
        else
          socket
        end
      }
    end
end
