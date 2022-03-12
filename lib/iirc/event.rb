module IIRC
  class Event
    attr_accessor :sender, :verb, :args, :tags

    def initialize(sender: nil, verb: nil, args: nil, tags: nil)
      self.sender = sender
      self.verb = verb
      self.args = args
      self.tags = tags
    end

    def sender=(v)
      v.extend Sender if v
      @sender = v
    end

    def args=(v)
      @args = v || []
    end

    def target
      args.first
    end

    def message
      args.last
    end
  end
end