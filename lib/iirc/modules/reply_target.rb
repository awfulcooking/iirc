module IIRC
  module ReplyTarget
    # The +reply_target+ of an event is the sender's nickname when _we_ are the
    # +target+. Otherwise, it returns the regular +target+.
    #
    # It lets us reply to events without having to repeat the `(me ===
    # target) ? sender.nick : target` logic used to make sure we don't message
    # ourselves when we receive a direct PRIVMSG, NOTICE, etc.

    def reply_target(evt)
      (me === evt.target) ? evt.sender.nick : evt.target
    end
  end
end