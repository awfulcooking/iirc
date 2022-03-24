module IIRC
  # A mixin which adds IRC hostmask introspection methods to strings.
  #
  # *CoolNick*, *:NickName*, <b>:nick!user@host</b>, *:server.name*, *another.server.name* forms are supported.
  #
  # A leading colon may be present in the string, and will be ignored.
  #
  # @example nick!user@example.com
  #   sender = "nick!user@example.com".extend(IIRC::Sender)
  #   sender.user? # => true
  #   sender.host  # => "example.com"
  # @example :irc.server
  #   sender = ":irc.server".extend(IIRC::Sender)
  #   sender.server? # => true
  #   sender.host    # => "irc.server"
  # @example JimBob
  #   sender = "JimBob".extend(IIRC::Sender)
  #   sender.user? # => true
  #   sender.nick  # => "JimBob"

  module Sender
    def user
      @user ||= User.from_source(self)
    end

    def server?
      user.nil?
    end

    def user?
      not user.nil?
    end

    def nick; user&.nick end
    def username; user&.username end
    def host; server? ? without_leading_colon : user.host end

    def to_prefix
      ":#{self}"
    end

    def without_leading_colon
      delete_prefix(':')
    end

    alias :to_s :without_leading_colon
    alias :inspect :to_prefix
  end

  module_function
    # Extends and returns a source string with the IIRC::Sender mixin.
    # Duplicates first if the string is frozen. Returns nil if source is nil.
    #
    # @example :nick!user@host
    #   v = IIRC.Sender(":JimmyWales!jim@wikipedia.org") # => "JimmyWales!jim@wikipedia.org"
    #   v.nick    # => "JimmyWales"
    #   v.host    # => "wikipedia.org"
    #   v.user?   # => true
    # @example server.name
    #   IIRC.Sender("services.libera.chat").server? # => true

    def Sender(source)
      if source.nil?
        nil
      else
        (source.frozen? ? source.dup : source).extend(Sender)
      end
    end
end