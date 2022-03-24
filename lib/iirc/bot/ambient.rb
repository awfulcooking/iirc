require_relative "reply_target"

module IIRC
  module Bot::AmbientEvents
    private
      def configure_ambient_events
        hook :set_ambient_event
      end

      def ambient_event
        Thread.current[:ambient_event]
      end

      def ambient_target; ambient_event&.target; end
      def ambient_sender; ambient_event&.sender; end

      def set_ambient_event(evt)
        Thread.current[:ambient_event] = evt
      end

      def with_ambient_event(evt)
        initial_event = ambient_event
        set_ambient_event(evt)
        begin
          yield evt
        ensure
          set_ambient_event(initial_event)
        end
      end
  end

  module Bot::AmbientEvents::LabeledRequests
    def labeled_request(*)
      initial_evt = ambient_event
      super do |reply|
        with_ambient_event(initial_evt) { yield reply }
      end
    end
  end

  module Bot::AmbientEvents::ReplyTarget
    include Bot::ReplyTarget
    def ambient_reply_target
      reply_target(ambient_event)
    end
  end

  module Bot::AmbientVerbs
    include Bot::AmbientEvents
    include Bot::AmbientEvents::ReplyTarget

    def join(channel=ambient_reply_target) super end
    def part(channel=ambient_reply_target, reason='') super end
    def msg(channel=ambient_reply_target, msg) super end
    def act(channel=ambient_reply_target, msg) super end
    def cycle(channel=ambient_reply_target, reason='') super end
    def mode(channel=ambient_reply_target, mode) super end
    alias :say :msg
  end
end