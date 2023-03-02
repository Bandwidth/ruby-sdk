module Bandwidth
  module Bxml
    class StopGather
      include Bandwidth::Bxml::Verb

      # Initializer
      def initialize
        super("StopGather", nil, {})
      end
    end
  end
end
