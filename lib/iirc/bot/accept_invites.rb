module IIRC
  module Bot::AcceptInvites
    # Override this to decide whether we should accept a given invite.
    # By default, all invites are accepted.
    # @param [Event]
    # @return [true] if we should join the channel
    def accept_invite?(evt)
      true
    end

    private
      def configure_accept_invites
        on :invite, :accept_invites
      end

      def accept_invites(evt)
        if me === evt.target and accept_invite?(evt)
          join evt.args[1]
        end
      end
  end
end
