module Bandwidth
  module Bxml
    class PauseRecording < Bandwidth::Bxml::Verb
      # Initializer
      def initialize
        super('PauseRecording', nil, {})
      end
    end
  end
end
