module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      operator '='
      command 'calculate'

      def self.call(client, data, match)
         message = `node /app/index.js #{ match['expression']}`
          client.say(channel: data.channel, text: message, gif: 'nothing')
      rescue StandardError => e
        client.say(channel: data.channel, text: "Sorry, #{e.message}.", gif: 'idiot')
      end
    end
  end
end
