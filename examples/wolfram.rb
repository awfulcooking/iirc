require "net/https"
require "iirc"

class Wolfram < IIRC::IRCv3Bot
  include Batteries
  include PrintIO

  def on_privmsg(evt)
    case evt.message
    when /^!(what .+)/, /^!(define .+)/
      answer($1).then { |answer|
        if answer == "Wolfram|Alpha did not understand your input"
          case rand(3)
          when 0
            say "I have no #{%w(earthly stinkin bloody).sample} idea :)"
          when 1
            say "If only I knew..."
          when 2
            say "#{evt.sender.nick}: If you ever find out, will you tell me?"
          end
        else
          say answer.capitalize
        end
      }
    end
  end

  def answer(query)
    url = URI.parse("https://api.wolframalpha.com/v1/result")
    url.query = URI.encode_www_form(i: query, appid: ENV['WOLFRAM_APP_ID'])

    Net::HTTP.get(url)
  end

  def autojoin_channels
    ['##wolframbot', '##iirc']
  end
end

Wolfram.run 'irc.libera.chat', nick: 'WolframBot'+rand(100).to_s
