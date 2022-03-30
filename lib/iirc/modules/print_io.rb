module IIRC
  # Wraps {Reading#lines} and {Bot#<<} to print lines received and sent to stdout.
  # Useful for debugging.
  module PrintIO
    # Prints `>> #{line}` to stdout, then yields, for each line from super.
    def lines
      super { |line| puts ">> #{line}"; yield line }
    end

    # Prints `<< #{line}` to stdout, then calls super
    # @return [self]
    def <<(line)
      puts "<< #{line}"
      super
    end
  end
end