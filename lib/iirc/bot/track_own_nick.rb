module IIRC
  module Bot::TrackOwnNick
    def on_nick evt
      if me === evt.sender
        self.user.nick = evt.args[0]
      end
    end
  end
end