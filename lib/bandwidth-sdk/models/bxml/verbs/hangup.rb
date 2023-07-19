module Bandwidth
  module Bxml
    class Hangup < Bandwidth::Bxml::Verb
      # Initializer
      def initialize
        super('Hangup', nil, {})
      end
    end
  end
end
