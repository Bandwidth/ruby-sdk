module Bandwidth
  module Bxml
    class ResumeRecording < Bandwidth::Bxml::Verb
      # Initializer
      def initialize
        super('ResumeRecording', nil, {})
      end
    end
  end
end
