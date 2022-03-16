module IIRC
  module Bot::PrintIO
    def lines
      super { |line| puts ">> #{line}"; yield line }
    end

    def <<(line)
      puts "<< #{line}"
      super
    end
  end
end