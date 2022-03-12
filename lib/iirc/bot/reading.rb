module IIRC
  module Bot::Reading
    def lines
      loop {
        yield socket.readline.force_encoding('utf-8').encode
      }
    end
  end
end