# frozen_string_literal: true

require "test_helper"

describe IIRC::RegexHooks do
  class IIRC::RegexHooks::TestSubject
    include IIRC::Hooks
    include IIRC::Configure
    include IIRC::RegexHooks
    include IIRC::Parsing

    def >>(line)
      evt = parse(line)
      fire! evt.verb, evt
    end
  end

  before do
    @subject = IIRC::RegexHooks::TestSubject.new
  end

  after do
    @subject.regex_hooks.keys.each { |key| @subject.off(key) }
  end

  it "fires regex hooks" do
    hello = its_me = 0

    @subject.on(/hello/) { hello += 1 }
    @subject.on(/it's me/) { its_me += 1 }

    @subject >> ":foo PRIVMSG #chan :well hello there"
    assert_equal hello, 1, "/hello/ not fired"
    assert_equal its_me, 0, "/it's me/ fired"

    @subject >> ":foo PRIVMSG #chan :i guess it's me"
    assert_equal hello, 1, "/hello/ fired"
    assert_equal its_me, 1, "/it's me/ not fired"

    @subject >> ":foo PRIVMSG #chan :let's try hello again"
    assert_equal hello, 2, "/hello/ not fired"
    assert_equal its_me, 1, "/it's me/ fired"
  end

  it "doesn't fire them for notices" do
    take = 0
    @subject.on(/take no notice/) { take += 1 }
    @subject >> ":foo NOTICE #chan :take no notice"
    assert_equal 0, take, "/take no notice/ fired"
  end

  it "passes matches as args" do
    args = []
    @subject.on(/^!foo (\d+) (\w+)/) { |evt,num,str| args << num << str }
    @subject >> ":foo PRIVMSG #chan :!foo 432 fu bar"
    assert_equal ["432", "fu"], args
  end
end
