module Bandwidth
  module Bxml
    class StreamParam
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super("StreamParam", nil, attributes)
        
        @attribute_map = {
          name: 'name',   # [String]: The name of this parameter, up to 256 characters.
          value: 'value', # [String]: The value of this parameter, up to 2048 characters.
        }
      end
    end
  end
end
