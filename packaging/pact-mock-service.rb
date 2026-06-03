$stderr.puts "WARN: This project is deprecated and no longer receiving updates. We recommend you upgrade to our supported tools: https://docs.pact.io/implementation_guides/cli"

require 'pact/mock_service/cli'

class Thor
  module Base
    module ClassMethods

      def basename
        # chomps the trailing .rb so it doesn't show in the help text
        File.basename($PROGRAM_NAME).split(" ").first.chomp(".rb")
      end
    end
  end
end

Pact::MockService::CLI.start
