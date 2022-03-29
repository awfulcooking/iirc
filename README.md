# Lean, mean IRC processing machine

```ruby
require 'iirc'

class CoolBot < IIRC::IRCv3Bot
  include Verbs

  def configure_coolness
    on /^!poke/, :poke_back
  end

  def poke_back(evt)
    act "pokes #{evt.sender.nick} back!!!"
  end

  def autojoin_channels
    ['##coolness']
  end
end

CoolBot.run 'irc.libera.chat' if __FILE__ == $0
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

## Usage

TODO: Flesh out usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/awfulcooking/iirc.
