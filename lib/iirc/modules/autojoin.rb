module IIRC
  # Automatically joins channels on RPL_WELCOME (001).  
  # 
  # Override {#autojoin_channels} to choose which channels to join.
  # {#autojoin!} may be called at any time to resend.
  module AutoJoin
    private def configure_autojoin
      on :'001', :autojoin!
    end

    # Send JOIN for each {#autojoin_channel}
    # @return [Array<String>] channels joined
    def autojoin!
      for channel in autojoin_channels
        self << "JOIN #{channel}"
      end
    end

    # The channels to join. By default, returns an empty array.
    # @return [Array<String>] channel names
    def autojoin_channels
      []
    end
  end
end