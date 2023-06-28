module Bandwidth
  module Bxml
    class StopTranscription
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super('StopTranscription', nil, attributes)
        
        @attribute_map = {
          name: 'name' # [String]: The name of the real-time transcription to stop. This is either the user selected name when sending the <StartTranscription> verb, or the system generated name returned in the Real-Time Transcription Started webhook if <StartTranscription> was sent with no name attribute. If no name is specified, then all active call transcriptions will be stopped.
        }
      end
    end
  end
end
