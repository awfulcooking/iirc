module IIRC
  module Configure
    def self.included(m)
      require 'set'
      m.extend ClassMethods
    end

    module ClassMethods
      def configure_actions
        @configures ||= Set.new
      end

      def configure action=nil, &blk
        configure_actions << (action || blk)
      end
    end

    def initialize(*)
      super if defined? super
      configure!
    end

    def configure!
      for action in configure_actions
        if action.is_a? Symbol
          send(action)
        else
          instance_exec(&action)
        end
      end
    end

    private def configure_actions
      singleton_class.ancestors
        .filter   { |m| m.respond_to?(:configure_actions) }
        .flat_map { |m| m.configure_actions.to_a }
        .concat((methods + private_methods).grep(/^configure_(?!actions)/))
        .compact
        .uniq
    end
  end

end