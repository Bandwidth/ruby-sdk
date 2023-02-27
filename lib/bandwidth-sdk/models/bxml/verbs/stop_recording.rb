module Bandwidth
  module Bxml
    class StopRecording
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      def initialize
        super("StopRecording", nil, {})
      end
    end
  end
end
