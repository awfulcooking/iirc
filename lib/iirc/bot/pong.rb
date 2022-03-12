module IIRC
  module Bot::Pong
    def on_ping evt
      self << "PONG :#{evt.args[0]}"
    end
  end
end