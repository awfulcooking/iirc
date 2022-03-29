module IIRC
  module PrintIO
    def lines
      super { |line| puts ">> #{line}"; yield line }
    end

    def <<(line)
      puts "<< #{line}"
      super
    end
  end
end