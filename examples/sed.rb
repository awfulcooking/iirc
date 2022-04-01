require "iirc"
require "timeout"

SED_REGEX ||= Regexp.new(DATA.read, Regexp::EXTENDED)

class SedBot < IIRC::IRCv3Bot
  include IIRC::Batteries
  include IIRC::AcceptInvites
  include IIRC::PrintIO

  def autojoin_channels
    ['##iirc']
  end

  def history
    @history ||= Hash.new { |h,k| h[k] = [] }
  end

  def on_privmsg evt
    case evt.message
    when SED_REGEX
      needle, sub, flags = Regexp.new($1, $3.include?('i')), $2, $3

      say Timeout.timeout(5) {
        history[reply_target]
          .find { |msg| msg =~ needle }
          .then { |msg|
            if msg and flags[/g/]
              italic msg.gsub(needle, sub)
            elsif msg
              italic msg.sub(needle, sub)
            else
              'Sorry, no match found'
            end
          }
      }
    else
      history[reply_target].unshift evt.message
    end
  end
end

if __FILE__ == $0
  SedBot.run 'irc.libera.chat', nick: 'Sed[%x]'%rand(256)
end

__END__

# Copied from https://www.azabani.com/2014/02/08/writing-irc-sedbot.html
# This matches the s/(needle)/(replacement)/(flags) parts of a sed pattern

^                       # start of the message
(?:                     # BEGIN first sed expression
  s/                    #   sed replacement expression delimiter
  (                     #   BEGIN needle component
    (?:                 #     BEGIN single needle character
      [^\\/]            #       anything that isn't a slash or backslash...
      |\\.              #       ...or any backslash escape
    )*                  #     END single needle character, zero or more
  )                     #   END needle component
  /                     #   slash between needle and replacement
  (                     #   BEGIN replacement component
    (?:                 #     BEGIN single replacement character
      [^\\/]|\\.        #       escape or non-slash-backslash, as above
    )*                  #     END single replacement character, zero or more
  )                     #   END replacement component
  /                     #   slash between replacement and flags
  (                     #   BEGIN flags component
    (?:                 #     BEGIN single flag
      g|i|\d+           #       "g", "i" or a sequence of digits
    )*                  #     END single flag, zero or more
  )                     #   END flags component
)                       # END first sed expression
(?:                     # BEGIN optional subsequent sed expressions
  ;                     #   semicolon between sed expressions
  s/                    #   sed replacement expression delimiter, as above
  ((?:[^\\/]|\\.)*)     #   needle component, as above
  /                     #   slash between needle and replacement, as above
  ((?:[^\\/]|\\.)*)     #   replacement component, as above
  /                     #   slash between replacement and flags, as above
  ((?:g|i|\d+)*)        #   flags component, as above
)*                      # END optional subsequent sed expressions, zero or more
$                       # end of the message
