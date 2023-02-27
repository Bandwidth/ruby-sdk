module Bandwidth
  module Bxml
    class Hangup
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      def initialize
        super("Hangup", nil, {})
      end
    end
  end
end
