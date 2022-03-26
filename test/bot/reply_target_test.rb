# frozen_string_literal: true

require "test_helper"

describe IIRC::Bot::ReplyTarget do
  before do
    @subject = IIRC::Bot.new(nil, nick: 'CoolBot')
  end

  it "is included in IIRC::Bot" do
    assert_includes IIRC::Bot.ancestors, IIRC::Bot::ReplyTarget
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

  describe "Target is a channel" do
    ['#AllNiteCafe', '&LocalChan'].each do |chan|
      describe(chan) do
        before do
          @examples = [
            'OtherNick!name@someone.else',
            'AnotherNick',
            'services.example.com',
            @subject.me.nick,
          ]
        end

        it "returns channel name" do
          for sender in @examples
            evt = IIRC::Event.new(sender: sender, verb: :privmsg, args: [chan, 'Hello there'])
            assert_equal @subject.reply_target(evt), chan
          end
        end
      end
    end
  end
end
