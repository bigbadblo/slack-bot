module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      operator '='
      command 'calculate'

      def self.call(client, data, match)
        `node index.js tvoff`        
          client.say(channel: data.channel, text: 'tv off.', gif: 'nothing')
      rescue StandardError => e
        client.say(channel: data.channel, text: "Sorry, #{e.message}.", gif: 'idiot')
      end
    end
  end
end
