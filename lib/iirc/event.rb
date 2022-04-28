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
      @sender = IIRC::Sender(v)
    end

    def args=(v)
      @args = v || []
    end

    def nick
      sender&.nick
    end

    def target
      args.first
    end

    def message
      args.last
    end

    CTCP_REGEX = /^\x01(\w+)(?: ([^\x01]+))?\x01?$/

    def ctcp?
      message&.match?(CTCP_REGEX)
    end

    def ctcp_verb
      $1.downcase.to_sym if message =~ CTCP_REGEX
    end

    def ctcp_message
      $2 if message =~ CTCP_REGEX
    end

    # Parses CTCP data in message, returning nil or an Array like [:action, "does the Macarena"], [:version], [:version, "SomeClient v0.1"]
    # @example Pattern matching (case)
    #   case evt.ctcp
    #   in [:action, msg]
    #     say "#{evt.nick} did an action: #{italic msg}"
    #   in [:version]
    #     say "\x01VERSION Ruby IIRC (v#{IIRC::VERSION})\x01"
    #   in [:dcc, type, *]
    #     say "You want to start a DCC #{type} with me? Are you crazy!?"
    #   else
    #   end
    # @example Pattern matching (if)
    #   on(:privmsg, :be_annoying) { |evt|
    #     act "#{thing} also" if [:action, thing] in evt.ctcp
    #   }
    # @return [Array<Symbol, String?>, nil] CTCP verb and text content, if any (e.g. [:action, "says hello"], [:clientinfo], [:version, "SomeClient v0.1"])
    def ctcp
      [ctcp_verb, ctcp_message].compact if ctcp?
    end
  end
end
