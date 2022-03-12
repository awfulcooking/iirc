module IIRC
  module Bot::Members
    def self.configure_actions
      [:listen_for_names]
    end

    def members
      @members ||= {}
    end

    private
      def listen_for_names
        on :'353', :receive_names
        on :'366', :receive_names_end
      end

      def receive_names evt
        names = evt.args[3]
        channel = evt.args[2]
        members_receiving[channel].concat names.tr('&+@%~', '').split(' ')
      end

      def receive_names_end evt
        channel = evt.args[1]
        members[channel] = members_receiving.delete(channel)
      end

      def members_receiving
        @members_receiving ||= Hash.new { |h,k| h[k] = [] }
      end
  end
end