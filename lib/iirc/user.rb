module IIRC
  class User
    attr_accessor :nick, :username, :realname, :host
    alias :name  :realname
    alias :gecos :realname

    class << self
      def from_sender(str)
        str = str[1..] if str.start_with? ':'

        username, _, host = str.partition("@")
        nick, _, username = username.partition("!")

        return nil if nick.include? '.' # sender is a server, not a user

        nick = nil if nick.empty?
        username = nil if username.empty?
        host = nil if host.empty?

        new(nick: nick, username: username, host: host)
      end

      alias :from_source :from_sender
    end

    def initialize(nick:nil,username:nil,realname:nil,host:nil)
      self.nick = nick
      self.username = username
      self.realname = realname
      self.host = host
    end

    def to_s
      "#{nick}".tap do |s|
        if username and host
          s << "!#{username}@#{host}"
        end
      end
    end

    def to_prefix
      ":#{self}"
    end

    def ===(other)
      if other.respond_to? :nick
        nick and nick.downcase == other.nick.downcase
      elsif other.is_a? String
        if other.include? ' ' or other.include? '.'
          false
        elsif nick
          nick and nick.downcase == User.from_source(other)&.nick&.downcase
        end
      else
        false
      end
    end
  end
end
