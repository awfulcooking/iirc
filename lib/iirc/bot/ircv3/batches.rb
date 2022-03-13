module IIRC
  module Bot::IRCv3
    class Batch < Event
      def events
        @events ||= []
      end
    end

    module Batches
      def configure_batches
        hook :receive_batches
      end

      def batches_in_flight
        @batches_in_flight ||= {}
      end

      def receive_batches evt
        return if evt.is_a? Batch # fully formed synthetic batch

        if evt.verb == :batch
          ± = evt.target[0]
          id = evt.target[1..]

          if ± == '+'
            batches_in_flight[id] = Batch.new(
              sender: evt.sender,
              verb: evt.verb,
              args: evt.args.dup.tap { |args| args[0] = id },
              tags: evt.tags,
            )
          else
            fire! :batch, batches_in_flight.delete(id)
          end
          raise StopIteration
        elsif evt.tags['batch']
          id = evt.tags['batch']
          batches_in_flight[id].events << evt
        end
      end
    end
  end
end