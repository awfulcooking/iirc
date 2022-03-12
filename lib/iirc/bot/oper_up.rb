module IIRC
  module Bot::OperUp
    def self.configure_actions
      [:add_oper_up_hook]
    end

    def add_oper_up_hook
      on :'001', :oper_up!
    end

    def oper_up!
      self << "OPER #{ENV['IRC_OPER']}" if ENV['IRC_OPER']
    end
  end
end