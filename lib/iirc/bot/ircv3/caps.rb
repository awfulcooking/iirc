module IIRC
  module Bot::IRCv3
    module Caps
      def caps
        raise NotImplementedError.new
      end

      def cap? name
        caps.include? name
      end

      def cap! name
        self << "CAP REQ :#{name}"
      end

      def cap_end!
        self << "CAP END"
      end
    end
  end
end