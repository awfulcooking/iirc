module IIRC
  module Bot::AutoJoin
    private def configure_autojoin_hook
      on :'001', :autojoin!
    end

    def autojoin!
      for channel in autojoin_channels
        self << "JOIN #{channel}"
      end
    end

    # override this to read from e.g. redis, config
    def autojoin_channels
      []
    end
  end
end