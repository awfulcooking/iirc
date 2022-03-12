module IIRC
  module Bot::Formatting
    module_function
      def bold s; "#{s}"; end
      def italic s; "#{s}"; end
      def strike s; "#{s}"; end
      def underline s; "#{s}"; end
      def strip s; s.gsub /\x03(?:\d{1,2}(?:,\d{1,2})?)?/, ''; end
      alias :strip_formatting :strip
  end
end