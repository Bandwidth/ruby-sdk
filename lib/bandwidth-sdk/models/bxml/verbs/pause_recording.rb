module Bandwidth
  module Bxml
    class PauseRecording
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      def initialize
        super("PauseRecording", nil, {})
      end
    end
  end
end
