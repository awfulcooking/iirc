require_relative "reply_target"

module IIRC
  # Ambient lets you access the current event without having to pass it around.
  # 
  # A thread-local variable is set by {Events} when an event comes in.  
  #
  # Overloads of {#say}, {#act}, {#mode}, {#join} etc. make their
  #   first argument optional.
  #
  # This module pulls in both {Events} and {Verbs}.
  #
  # @example say (with Ambient)
  #   def on_privmsg
  #     say "Hello!"
  #   end
  # @example say (without)
  #   def on_privmsg(evt)
  #     say reply_target(evt), "Hello!"
  #   end
  # @example mode (with Ambient)
  #   def on_join(evt)
  #     mode "+v #{evt.nick}"
  #   end
  module Ambient
    module Events
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

    module LabeledRequests
      def labeled_request(*)
        initial_evt = ambient_event
        super do |reply|
          with_ambient_event(initial_evt) { yield reply }
        end
      end
    end

    module ReplyTarget
      def reply_target(evt=ambient_event) super end
    end

    module Verbs
      include Events
      include ReplyTarget

      def join(channel=reply_target) super end
      def part(channel=reply_target, reason='') super end
      def msg(target=reply_target, msg) super end
      def act(target=reply_target, msg) super end
      def cycle(channel=reply_target, reason='') super end
      def mode(target=reply_target, mode) super end
      alias :say :msg
    end

    include Verbs
  end
end
