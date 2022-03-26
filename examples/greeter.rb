require "iirc"

class Greeter < IIRC::Bot
  include AutoJoin
  include Verbs
  include PrintIO

  def on_join(evt)
    say evt.target, "Hello #{evt.sender.nick}!" unless me === evt.sender
  end

  def autojoin_channels
    ['##iirc']
  end
end

Greeter.run 'irc.libera.chat', nick: 'GreeterBot' if __FILE__ == $0