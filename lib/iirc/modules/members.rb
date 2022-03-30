module IIRC
  # Processes lists of channel participants sent by the server into {#members}.  
  # Namely, it processes NAMES replies, such as the ones sent automatically when we
  # join a channel.
  # @note IIRC doesn't send NAMES by itself, but will process any replies received, such
  #   as to JOIN, or any requests you have made yourself.
  # @see IIRC::Verbs#names send a NAMES request
  module Members
    # Nicknames present in channels, by channel.
    # Updated from NAMES replies.
    # @return [Hash<String,[String]>]
    def members
      @members ||= {}
    end

    private
      # @note In a future release, this may also track using JOIN/KICK/PART, etc.
      def configure_members_tracking
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

      # @return [Hash]
      def members_receiving
        @members_receiving ||= Hash.new { |h,k| h[k] = [] }
      end
  end
end