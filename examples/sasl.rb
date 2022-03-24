require "iirc"

module SASLExample
  class Plain < IIRC::Batteries
    include IRCv3::SASL
    include PrintIO

    def sasl_credentials
      ['AzureDiamond', 'hunter2']
    end
  end

  class Plain::Manual < IIRC::Batteries
    include IRCv3::SASL
    include PrintIO
  end

  class External < IIRC::Batteries
    include IRCv3::SASL
    include PrintIO

    def sasl_method
      :external
    end
  end

  module_function
    def run_plain
      Plain.run('cyberspace.baby', nick: 'Azure')
    end

    def run_plain_manual(user, pass)
      Plain::Manual.run('cyberspace.baby', nick: 'Delphi') do |bot|
        sasl_plain! user, pass
      end
    end

    def run_external(cert_path, key_path)
      cert = OpenSSL::X509::Certificate.new open(cert_path)
      key = OpenSSL::PKey.read open(key_path)

      context = IIRC::SSL.verify
      context.add_certificate(cert, key)

      External.run('cyberspace.baby', nick: 'Jones', ssl_context: context)
    end

    def run(argv)
      case argv.first
      when nil
        run_plain
      when 'plain'
        run run_plain_manual argv[1], argv[2]
      when 'external'
        run_external(argv[1] || 'client.cert', argv[2] || 'client.key')
      end
    end
end

if __FILE__ == $0
  SASLExample.run ARGV
end