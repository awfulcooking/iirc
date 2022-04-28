module IIRC
  class Bot
    attr_accessor :socket
    attr_accessor :user
    alias :me :user

    def <<(text)
      socket << text + "\r\n"
      self
    end

    def to_s
      "[#{self.class.name}:#{user.nick}]"
    end

    def inspect
      "<#{me}>"
    end

    def initialize(socket=nil, user={})
      super() if defined? super
      self.socket = socket
      self.user = user.is_a?(User) ? user : User.new(**user)

      if !user.key?(:nick)
        self.user.nick ||= self.class.name&.split('::')&.last
      end
    end

    def register!
      ensure_registration_info!
      self << "USER #{me.username} 0 0 :#{me.realname}"
      self << "NICK #{me.nick}"
    end

    private def ensure_registration_info!
      me.username ||= me.nick&.downcase
      me.realname ||= me.nick
      raise ArgumentError.new('no nick given') unless me.nick && !me.nick.empty?
    end
  end
end
