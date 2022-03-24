# frozen_string_literal: true

require "test_helper"

describe IIRC::Bot::ReplyTarget do
  class Subject < IIRC::Bot
    include ReplyTarget
  end

  before do
    @subject = Subject.new(nil, nick: 'CoolBot')
  end

  describe "Target is me" do
    before do
      @examples = {
        'OtherNick!name@someone.else' => 'OtherNick',
        'AnotherNick' => 'AnotherNick',
        @subject.me.nick => @subject.me.nick,
      }
    end

    it "returns sender's nick" do
      for sender, expectation in @examples
        evt = IIRC::Event.new(sender: sender, verb: :privmsg, args: [@subject.me.nick, 'Hello there'])
        assert_equal @subject.reply_target(evt), expectation
      end
    end
  end

  describe "Target is me" do
    before do
      @examples = {
        'OtherNick!name@someone.else' => 'OtherNick',
        'AnotherNick' => 'AnotherNick',
        @subject.me.nick => @subject.me.nick,
      }
    end

    it "returns sender's nick" do
      for sender, expectation in @examples
        evt = IIRC::Event.new(sender: sender, verb: :privmsg, args: [@subject.me.nick, 'Hello there'])
        assert_equal @subject.reply_target(evt), expectation
      end
    end
  end
end