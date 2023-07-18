module Bandwidth
  module Bxml
    class ResumeRecording
      include Bandwidth::Bxml::Verb

      # Initializer
      def initialize
        super('ResumeRecording', nil, {})
      end
    end
  end
end
