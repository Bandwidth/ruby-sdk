module Bandwidth
  module Bxml
    class StopRecording < Bandwidth::Bxml::Verb
      # Initializer
      def initialize
        super('StopRecording', nil, {})
      end
    end
  end
end
