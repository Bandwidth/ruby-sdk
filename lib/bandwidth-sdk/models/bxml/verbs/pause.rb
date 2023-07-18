module Bandwidth
  module Bxml
    class Pause
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super('Pause', nil, attributes)
        
        @attribute_map = {
          duration: 'duration', # Optional [Number]: The time in seconds to pause. Default value is 1.
        }
      end
    end
  end
end
