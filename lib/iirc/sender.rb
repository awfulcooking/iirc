module IIRC
  module Sender
    def user
      @user ||= User.from_sender(self)
    end

    def server?
      user.nil?
    end

    def user?
      not user.nil?
    end

    def nick; user&.nick end
    def username; user&.username end
    def host; user&.host end

    def to_prefix
      ":#{self}"
    end

    def to_s
      delete_prefix(':')
    end

    alias :inspect :to_prefix
  end
end