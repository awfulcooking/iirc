module IIRC
  module Pong
    def on_ping evt
      self << "PONG :#{evt.args[0]}"
    end
  end
end