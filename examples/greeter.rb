require "iirc"

class Greeter < IIRC::Bot
  include IIRC::AutoJoin
  include IIRC::Verbs
  include IIRC::PrintIO

  def on_join(evt)
    say evt.target, "Hello #{evt.nick}!" unless me === evt.sender
  end

  def autojoin_channels
    ['##iirc']
  end
end

IIRC.cli << Greeter
