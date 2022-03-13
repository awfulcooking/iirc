module IIRC
  module Bot::OperUp
    def oper_up!
      self << "OPER #{ENV['IRC_OPER']}" if ENV['IRC_OPER']
    end

    private
      def configure_oper_up
        on :'001', :oper_up!
      end
  end
end