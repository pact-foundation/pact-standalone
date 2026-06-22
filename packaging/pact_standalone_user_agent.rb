PACT_STANDALONE_VERSION = File.read(File.join(__dir__, 'VERSION')).strip

require 'pact_broker/client/user_agent'
PactBroker::Client.tool_identifier = "pact-standalone/#{PACT_STANDALONE_VERSION}"
