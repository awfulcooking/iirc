# frozen_string_literal: true

module IIRC
  # Parses RPL_ISUPPORT (005) events into a Hash.
  #
  # These are sent by servers after registration to provide info about the network,
  # what the server supports, and how it behaves.
  #
  # Provides a Hash of the raw values, extended with helper methods which process them.
  #
  # @see https://defs.ircdocs.horse/defs/isupport.html List of tokens and their values (defs.ircdocs.horse)
  # @see https://datatracker.ietf.org/doc/html/draft-hardy-irc-isupport-00
  # @see https://datatracker.ietf.org/doc/html/draft-brocklesby-irc-isupport-00
  module ISupport
    # Hash of tokens sent by the server after registration indicating feature support and limits.
    # @return [Hash#extend(Inquiry)] the raw isupport key=>value pairs. keys with no value are assigned +true+.
    def isupport
      @isupport ||= {}.extend(Inquiry)
    end

    private
      def configure_isupport
        on :'005', :store_isupport
      end

      def store_isupport(evt)
        tokens = evt.args[1..-2]

        for token in tokens
          name, value = token.split('=', 2)
          isupport[name] = value.freeze || true
        end
      end
  end

  # Methods for inquiry into a Hash of raw ISUPPORT key=>value pairs.
  # These are mixed in to the Hash returned by {ISupport#isupport}.
  #
  # The key=>value format returned by #isupport won't change.
  # Rather, methods which process the values can be added here.
  module ISupport::Inquiry
    # Whether or not the server supports a user mode which lets clients mark themselves as bots.
    def bot_mode?
      !!bot_mode
    end

    # User mode which can be used to mark clients as bots.
    # @return [String] mode char (usually 'B')
    # @return [nil] if mode is not supported
    def bot_mode
      self['BOT']
    end

    # A string indicating the case mapping used by the server to determine case-insensitive equality
    # of channel names and nick names.
    #
    # @note IIRC does not currently perform case-insensitive comparisons. This may change in future.
    # @return [String] the name of the casemapping. e.g. 'ascii', 'rfc1459', 'rfc3454'
    def case_mapping
      self['CASEMAPPING']
    end

    # Characters used as channel prefixes by this server.
    # @see https://defs.ircdocs.horse/defs/chantypes.html
    # @return [Array] prefixes, e.g. ['#', '&']
    def channel_prefixes
      (@channel_prefixes ||= self['CHANTYPES']&.chars.freeze) || ['#'].freeze
    end

    # Modes which grant privileges to a user in a channel and their respective
    # prefix characters seen in NAMES, WHO and WHOIS replies.
    # @see https://modern.ircdocs.horse/#channel-membership-prefixes
    # @example qaohv
    #   isupport.prefix_modes # => {'q'=>'~', 'a'=>'&', 'o'=>'@', 'h'=>'%', 'v'=>'+'}
    # @return [Hash<String,String>] channel mode => prefix character
    def prefix_modes
      if self['PREFIX'].is_a? String
        modes, symbols = self['PREFIX'][1..].split(')').map!(&:chars)
        Hash[modes.zip(symbols)].freeze
      else
        {}.freeze
      end
    end
  end
end
