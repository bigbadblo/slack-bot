 module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      operator 'echo'
      command 'echo'
      
      def self.call(client, data, match)
       client.say(channel: data.channel, text: "#{match[:operator]}: #{match[:expression]}")
       client.say(channel: data.channel, text: "#{match.inspect}")
      rescue StandardError => e
        client.say(channel: data.channel, text: "Sorry, #{e.message}.", gif: 'idiot')
      end
    end
  end
end
