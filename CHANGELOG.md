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
