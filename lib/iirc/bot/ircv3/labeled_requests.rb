module IIRC
  module Bot::IRCv3
    module LabeledRequests
      def labeled_request(line)
        SecureRandom.alphanumeric(8).tap { |id|
          labeled_requests[id] = -> evt { yield evt }
          self << "@label=#{id} #{line}"
        }
      end

      def labeled_requests
        @requests ||= {}
      end

      private
        def configure_labeled_requests
          hook :dispatch_replies
        end

        def dispatch_replies(evt)
          if evt.tags['label']
            labeled_requests.delete(evt.tags['label'])&.call(evt)
          end
        end
    end
  end
end