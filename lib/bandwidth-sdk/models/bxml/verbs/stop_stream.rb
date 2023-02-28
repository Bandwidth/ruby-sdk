module Bandwidth
  module Bxml
    class StopStream
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super("StopStream", nil, attributes)
        
        @attribute_map = {
          name: 'name' # [String]: The name of the stream to stop. This is either the user selected name when sending the <StartStream> verb, or the system generated name returned in the Media Stream Started webhook if <StartStream> was sent with no name attribute.
        }
      end
    end
  end
end
