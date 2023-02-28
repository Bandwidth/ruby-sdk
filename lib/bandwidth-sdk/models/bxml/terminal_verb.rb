module Bandwidth
  module Bxml
    module TerminalVerb
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param tag [String] Name of the XML element.
      # @param content [String] XML element content. Defaults to nil.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(tag, content = nil,  attributes = {})
        super(tag, content, [], attributes)
      end
    end
  end
end
