## [0.5.0] - 2022-03-29

- [Batteries] is now a module. Please change `class Foo < IIRC::Batteries`
    to `class Foo < IIRC::IRCv3Bot; include Batteries; end`

- [Event] Add #nick method (equivalent to sender.nick)

- Improved README

## [0.4.2] - 2022-03-29

- Fix example in README

## [0.4.1] - 2022-03-29

- [ISupport] Add module to process RPL_ISUPPORT
- [ISupport] Add Inquiry helpers + docs

## [0.4.0] - 2022-03-27

- [Numerics] Add module with constants imported from ircdocs.horse
  - Run `rake numerics` to re-import.

- [IIRC.run,IIRC.dial] Support passing a symbol as ssl_context
	- e.g. ssl_context: :no_verify instead of ssl_context: IIRC::SSL.no_verify

- The AmbientEvents modules have been reorganised
  - AmbientVerbs is now Ambient::Verbs
  - AmbientEvents => Ambient::Events
  - AmbientEvents::{LabeledRequests,ReplyTarget} => Ambient::{LabeledRequests,ReplyTarget}

- #ambient_reply_target() has been replaced with #reply_target(evt=ambient_event)

- [Bot.run] Set nick to class name if no param is given
  - `MyBot.run('irc.libera.chat')` is enough to connect to Libera as 'MyBot'

## [0.3.0] - 2022-03-26

- [Bot] Include ReplyTarget
- [Hooks] Refactor
- Add AcceptInvites module
- Improve Greeter example
- [IIRC.run,IIRC.dial] now accept local_host, local_port keyword arguments

## [0.2.9] - 2022-03-24

- Add reply target concept (Bot::ReplyTarget)
  - The reply target of an event is the sender's nick when we are its target,
    and equal to the regular target otherwise.
  - The ambient verb methods now target the reply target of the ambient event by default.
  - Should make writing actions more convenient.

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
