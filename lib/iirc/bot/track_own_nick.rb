module IIRC
  module Bot::TrackOwnNick
    private

      def configure_own_nick_tracking
        on :nick,  :track_own_nick_change
      end

      def track_own_nick_change evt
        me.nick = evt.args[0] if me === evt.sender
      end
  end
end