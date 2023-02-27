module Bandwidth
  module Bxml
    class ResumeRecording
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      def initialize
        super("ResumeRecording", nil, {})
      end
    end
  end
end
