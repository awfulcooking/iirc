require_relative "iirc/version"

require_relative "iirc/event"
require_relative "iirc/sender"
require_relative "iirc/user"

require_relative "iirc/bot"
require_relative "iirc/numerics"

require_relative "iirc/modules/accept_invites"
require_relative "iirc/modules/ambient"
require_relative "iirc/modules/autojoin"
require_relative "iirc/modules/channels"
require_relative "iirc/modules/configure"
require_relative "iirc/modules/formatting"
require_relative "iirc/modules/hooks"
require_relative "iirc/modules/isupport"
require_relative "iirc/modules/members"
require_relative "iirc/modules/oper_up"
require_relative "iirc/modules/parsing"
require_relative "iirc/modules/pong"
require_relative "iirc/modules/print_io"
require_relative "iirc/modules/reading"
require_relative "iirc/modules/redis"
require_relative "iirc/modules/regex_hooks"
require_relative "iirc/modules/reply_target"
require_relative "iirc/modules/track_own_nick"
require_relative "iirc/modules/verbs"

require_relative "iirc/modules/ircv3/caps"
require_relative "iirc/modules/ircv3/parsing"
require_relative "iirc/modules/ircv3/batches"
require_relative "iirc/modules/ircv3/labeled_requests"

module IIRC
  class Error < StandardError; end

  class Bot
    include Reading
    include Parsing
    include Hooks
    include Configure
    include Pong
    include TrackOwnNick
    include ReplyTarget

    def self.run(host, port=6697, local_host: nil, local_port: nil, ssl_context: SSL.default_context, **user_params, &blk)
      socket = IIRC.dial(host, port,
        local_host: local_host, local_port: local_port,
        ssl_context: ssl_context)

      user_params[:nick] = self.name&.split('::').last if !user_params.key?(:nick)

      new(socket, **user_params).tap { |bot|
        bot.register!
        bot.tap(&blk) if blk
        bot.run
      }
    end
  end

  class IRCv3Bot < Bot
    include IRCv3::Parsing
    include IRCv3::Caps
    include IRCv3::Batches
    include IRCv3::LabeledRequests
  end

  # Batteries is a recommended set of modules for writing interactive bots.
  module Batteries
    include Channels
    include Members
    include Formatting
    include AutoJoin
    include Verbs
    include Ambient
    include RegexHooks
    include ISupport
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
    def dial(host, port=6697, local_host: nil, local_port: nil, ssl_context: SSL.default_context)
      require 'socket'

      Socket.tcp(host, port, local_host, local_port).then { |socket|
        if ssl_context
          ssl_context = SSL.send(ssl_context) if ssl_context.is_a? Symbol

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

def IIRC(*args, **kwargs, &blk)
  Class.new(IIRC::IRCv3Bot, &blk)
end
