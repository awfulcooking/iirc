module IIRC
  module Bot::ISupport
    def isupport
      @isupport ||= {}
    end

    private
      def configure_isupport
        on :'005', :store_isupport
      end

      def store_isupport(evt)
        tokens = evt.args[1..-2]

        for token in tokens
          name, value = token.split('=', 2)
          isupport[name] = value || true
        end
      end
  end
end
