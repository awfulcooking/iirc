module IIRC
  module Parsing
    def parse(line)
      Event.new.tap { |evt|
        words = line.chomp.split " "

        if words[0] and words[0].start_with? ":"
          evt.sender = words.shift[1..]
        end

        evt.verb = words.shift.downcase.to_sym

        while word = words.shift
          if word.start_with? ':'
            evt.args << [word[1..], *words].join(' ')
            break
          else
            evt.args << word
          end
        end
      }
    end
  end
end