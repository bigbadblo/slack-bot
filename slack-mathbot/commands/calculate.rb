module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      operator '='
      command 'calculate'
      
      def self.permitted?(client, data, match)
        data && data.user && data.user == 'brian'
      end
      
      def self.call(client, data, match)
         message = `node /app/index.js #{ match['expression']}`
          client.say(channel: data.channel, text: message)
      rescue StandardError => e
        client.say(channel: data.channel, text: "Sorry, #{e.message}.")
      end
    end
  end
end
