module IIRC
  module Verbs
    def join(channel) self << "JOIN #{channel}" end
    def part(channel, reason=nil) self << "PART #{channel}#{" :#{reason}" if reason}" end
    def names(channel) self << "NAMES #{channel}" end
    def who(target) self << "WHO #{target}" end
    def msg(target, msg) for line in msg.to_s.lines; self << "PRIVMSG #{target} :#{line.chomp}"; end; self end
    def act(target, msg) for line in msg.to_s.lines; self << "PRIVMSG #{target} :\001ACTION #{line.chomp}\001"; end; self end
    def notice(target,msg) for line in msg.to_s.lines; self << "NOTICE #{target} :#{line.chomp}"; end; self end
    def quit(msg='Quitting') self << "QUIT :#{msg}" end
    def invite(target, channel) self << "INVITE #{target} #{channel}" end
    def cycle(target, reason='') part(target, reason); join(target) end
    def nick(new) self << "NICK #{new}" end
    def ping(token=nil) self << (token ? "PING :#{token}" : "PING") end
    def pong(token=nil) self << (token ? "PONG :#{token}" : "PONG") end
    def mode(target, mode) self << "MODE #{target} #{mode}" end
    def wallops(msg) for line in msg.to_s.lines; self << "WALLOPS :#{line.chomp}"; end; self end
    def kill(target, msg='.') self << "KILL #{target} :#{msg}" end
    def kick(channel, target, msg='') self << "KICK #{channel} #{target} :#{msg}" end
    def topic(channel, new_topic='') self << (new_topic ? "TOPIC #{channel} :#{new_topic.lines.first.chomp}" : "TOPIC #{channel}") end

    alias :privmsg :msg
    alias :say :msg
  end
end