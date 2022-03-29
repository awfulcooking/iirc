module IIRC
  module IRCv3
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
    end
  end
end