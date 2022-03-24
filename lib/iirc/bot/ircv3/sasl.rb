module IIRC
  module Bot::IRCv3
    ## Performs SASL authentication during registration.
    # Supported mechanisms are PLAIN and EXTERNAL.
    #
    # @see https://ircv3.net/specs/extensions/sasl-3.1.html
    #
    # @example Plain (credentials defined on class)
    #   class CoolBot < IRCv3Bot
    #     include IRCv3::SASL
    #     def sasl_credentials
    #       ['AzureDiamond', 'hunter2']
    #     end
    #   end
    #
    # @example Plain (credentials sent manually in run block)
    #   IRCv3Bot.run(host, nick: 'CoolBot') { |bot| bot.sasl_plain! "Jane", "sugar&spice" }
    #
    # @example External
    #   class CoolBot < IRCv3Bot
    #     def sasl_method
    #       :external
    #     end
    #   end
    module SASL
      module_function def encode_sasl_plain(credentials)
        return nil unless credentials
        if credentials.count == 2
          credentials = [credentials[0], *credentials]
        end
        encode_sasl_payload credentials.join("\0")
      end

      module_function def encode_sasl_payload(payload)
        require 'base64'
        Base64.strict_encode64(payload)
      end

      # Overrides {Bot#register!} to perform SASL authentication
      def register!
        if sasl_method == :plain and sasl_credentials.nil?
          super
        else
          cap! 'sasl'; super; register_sasl!
        end
      end

      # Override this to define the SASL method to use
      # e.g. :plain, :external
      def sasl_method
        :plain
      end

      # Credentials to use for SASL plain.
      # Should be an Array [user,pass], or nil, to skip.
      def sasl_credentials() end

      def sasl_plain! user, pass
        self << "AUTHENTICATE PLAIN"
        self << "AUTHENTICATE " + encode_sasl_plain([user, pass])
      end

      def sasl_external!
        self << "AUTHENTICATE EXTERNAL"
        self << "AUTHENTICATE +"
      end

      private
        def configure_sasl
          on :'903', :cap_end!
        end

        def register_sasl!
          case sasl_method
          when :plain
            sasl_plain! *sasl_credentials
          when :external
            sasl_external!
          else
            raise ArgumentError.new("SASL method unsupported: #{sasl_method.inspect}")
          end
        end
    end
  end
end