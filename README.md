# Lean, mean IRC processing machine

IIRC is a new IRC framework for Ruby.

It supports IRCv3 features such as message tags, batch and labeled-response.

It's based on composition, with code reload, extensibility and predictability in mind,

```ruby
require 'iirc'

class CoolBot < IIRC::IRCv3Bot
  include Verbs
  include AutoJoin
  include RegexHooks
  include PrintIO

  def configure_coolness
    on /^!poke/, :poke_back
  end

  def poke_back(evt)
    act reply_target(evt), "pokes #{evt.nick} back!!!"
  end

  def autojoin_channels
    ['##coolness']
  end
end

CoolBot.run 'irc.libera.chat' if __FILE__ == $0
```

```ruby
require 'iirc'

class SillyBot < IIRC::IRCv3Bot
  include AcceptInvites
  include Batteries # Verbs, Ambient, RegexHooks used here

  def configure_silliness
    on /^!uptime/, :say_uptime
    on :part, :say_good_riddance
  end

  @@start_time ||= Time.now
  def say_uptime
    say "I've been up for #{((Time.now-@@start_time)/60/60).truncate(2)} hours"
  end

  def say_good_riddance
    say 'Good riddance!'
  end
end

SillyBot.run 'irc.libera.chat' if __FILE__ == $0
```

## Events

Incoming lines are parsed as an IIRC::Event, and fired based on their verb.

The Event structure and firing pattern is the same, no matter the verb.

PRIVMSG fires :privmsg. NOTICE fires :notice. RPL_WELCOME (001) fires :"001".

## Hooks

Hooks are added using #on, and removed using #off.

They are stored in a Set, so adding the same hook twice is idempotent.

This supports code reloading.

## Adding behaviour from classes and modules

To set up behaviour from a class or module, write a configure method:

```ruby
module Greet
  def configure_greeting
    on :join, :do_greeting
  end

  def do_greeting evt
    unless me === evt.nick
      say reply_target(evt), "Hello #{evt.nick}!"
    end
  end
end

class MyBot < IIRC::IRCv3Bot
  include Greet

  def configure_some_feature
    on :this, :do_that
  end

  def do_that(evt) end
end
```

Configure methods are called automatically on a new instance, and can be run again with #configure!

You might call configure! after reloading code, extending or including modules at runtime.

## Hot reload

For example:

```ruby
class CoolBot < IIRC::IRCv3Bot
  include RegexHooks

  def configure_reload
    on /^=reload/, :reload!
  end

  def reload!
    $LOADED_FEATURES
      .filter { |file| file.start_with?(__dir__) }
      .each   { |file| load file }
    configure!
  end
end

if __FILE__ == $0
  CoolBot.run 'irc.libera.chat'
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iirc'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install iirc

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/awfulcooking/iirc.
