module IIRC
  # Accept INVITEs to join a channel.
  # By default, all invites are accepted.  
  # To choose which ones to accept, define {#accept_invite?} on your object / class.
  module AcceptInvites
    # Decides whether to accept a given INVITE.
    # By default, all invites are accepted.
    # @param evt [Event] the invite
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
