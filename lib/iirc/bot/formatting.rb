module IIRC
  module Bot::Formatting
    module_function
      def bold(s) "\x02#{s}\x02" end
      def italic(s) "\x1d#{s}\x1d" end
      def strike(s) "\x1e#{s}\x1e" end
      def underline(s) "\x1f#{s}\x1f" end
      def strip(s) s.gsub(/\x03(?:\d{1,2}(?:,\d{1,2})?)?/, '') end
      alias :strip_formatting :strip
  end
end