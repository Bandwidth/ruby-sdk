module Bandwidth
  module Bxml
    class Ring
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super("Ring", nil, attributes)
        
        @attribute_map = {
          duration: 'duration',       # Optional [Number]: How many seconds to play ringing on the call. Default value is 5. Range: decimal values between 0.1 - 86400.
          answer_call: 'answerCall',  # Optional [Boolean]: A boolean indicating whether or not to answer the call when Ring is executed on an unanswered incoming call. Default value is 'true'.
        }
      end
    end
  end
end
