require "iirc"

IIRC {
  include IIRC::Batteries
  include IIRC::PrintIO

  def facts
    @facts ||= {}
  end

  def on_privmsg(evt)
    case evt.message
    when /^=list\b/
      say "I know about #{facts.empty? ? 'nothing' : facts.keys.join(', ')}"
    when /^=tell ([[:alnum:]]+)/
      say facts[$1] ? "#{$1} is #{facts[$1]}" : "I don't know what that is"
    when /^=add ([[:alnum:]]+) (.+)/
      say "Okay, #{$1} is #{$2}"
      facts[$1] = $2
    when /^=del ([[:alnum:]]+)/
      say "Okay, forgetting #{$1}"
      facts.delete $1
    end
  end

  def autojoin_channels
    ['##facts', '##iirc']
  end

  run "irc.libera.chat", nick: "FactBot[#{rand(100)}]"
}
