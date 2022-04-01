module IIRC
  module RegexHooks
    def regex_hooks
      hooks.filter { |k,v| Regexp === k }.freeze
    end

    private
      def configure_regex_hooks
        on :privmsg, :do_regex_matches
      end

      def do_regex_matches(evt)
        regex_hooks
          .filter { |k,v| k === evt.message }
          .each_value { |actions|
            actions.each { |action| call action, evt, *Regexp.last_match&.values_at(1..) }
          }
      end
  end
end
