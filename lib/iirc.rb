require_relative "iirc/version"

require_relative "iirc/event"
require_relative "iirc/sender"
require_relative "iirc/user"

require_relative "iirc/bot"
require_relative "iirc/bot/autojoin"
require_relative "iirc/bot/channels"
require_relative "iirc/bot/configure"
require_relative "iirc/bot/formatting"
require_relative "iirc/bot/hooks"
require_relative "iirc/bot/members"
require_relative "iirc/bot/oper_up"
require_relative "iirc/bot/parsing"
require_relative "iirc/bot/pong"
require_relative "iirc/bot/reading"
require_relative "iirc/bot/redis"
require_relative "iirc/bot/regex_hooks"
require_relative "iirc/bot/track_own_nick"
require_relative "iirc/bot/verbs"

require_relative "iirc/bot/ircv3/caps"
require_relative "iirc/bot/ircv3/parsing"
require_relative "iirc/bot/ircv3/batches"

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
  end

  class Batteries < IRCv3Bot
    include Channels
    include Members
    include Formatting
    include AutoJoin
    include Verbs
  end
end
