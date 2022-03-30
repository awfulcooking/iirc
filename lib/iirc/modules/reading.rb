module IIRC
  module Reading
    # Read lines from {#socket} in a blocking loop until EOF or an error is raised.
    # @return nil
    # @yield [String] line encoded as UTF-8.
    def lines
      loop {
        yield socket.readline.force_encoding('utf-8').encode
      }
    end
  end
end