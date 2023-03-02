module Bandwidth
  module Bxml
    class Hangup
      include Bandwidth::Bxml::Verb

      # Initializer
      def initialize
        super("Hangup", nil, {})
      end
    end
  end
end
