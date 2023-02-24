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

      # Adding verbs is not allowed for this class
      # @param nested_verbs [Verb] or [Array<Verb>] Verb or verbs to add to the array.
      def add_verb(nested_verbs)
        raise NameError.new('adding nested verbs is not allowed for this class.')
      end
    end
  end
end
