module IIRC
  # Keeps track of the channels we are currently in.
  # The list can be retrieved with {#channels}.
  # Based on JOIN, PART and KICK messages received for our nick.
  module Channels
    # @return [Set<String>] 
    def channels
      @channels ||= Set.new
    end

    private
      def configure_channel_tracking
        hook :track_own_channels
      end

      def track_own_channels(evt)
        case evt.verb
        when :'001'
          channels.clear
        when :join
          if me === evt.sender
            for c in evt.target.split(',')
              channels << c
            end
          end
        when :part
          if me === evt.sender
            for c in evt.target.split(',')
              channels.delete(c)
            end
          end
        when :kick
          if me === evt.args[1]
            channels.delete(evt.target)
          end
        end
      end
  end
end