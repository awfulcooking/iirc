## [0.2.8] - 2022-03-22

- Add MIT license

## [0.2.7] - 2022-03-16

- Include Bot::RegexHooks in Batteries

## [0.2.6] - 2022-03-16

- Add ircparser dependency
  - It's technically optional, but it's needed to parse IRCv3 messages

## [0.2.5] - 2022-03-16

- Add dial method. Uses SSL by default, with configurable context
- Add Bot.run method. Dials, yields an instance, then calls #run
- Add IIRC() method to top-level for DSL shorthand
  - See examples/facts.rb
- Add examples/ (Facts, Greeter, Wolfram)

## [0.2.4] - 2022-03-15

- [Bot::Hooks] Run catch-all hooks before on_#{verb} ones
- Include Bot::AmbientVerbs in Batteries
  - Lets you write `say "Hello"` in event handlers instead of `say evt.target, "Hello"`
  - Defaults the first arg of say,act,join,part,cycle,mode to the target of the current event
- Add Bot::PrintIO module

## [0.2.3] - 2022-03-14

- Use new configure style for Bot::OperUp
- Use new configure style for Bot::TrackOwnNick
- Update own nick from welcome message (001)

## [0.2.2] - 2022-03-13

- Use escape sequences in formatting.rb for readability

- Fix Event reference in parse()
  - Bot::Event was moved to Event during refactor
  - Missed as my code uses `include IIRC` at the top level

## [0.2.1] - 2022-03-12

- Add User.from_source(str) alias

## [0.2.0] - 2022-03-12

- Extracted Bot::AmbientEvents
- Extracted IRCv3::LabeledRequests

## [0.1.0] - 2022-03-12

- Library extracted from bot (developed since Dec 2021)
- Yay first release \o/
