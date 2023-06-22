require 'ox'

module Bandwidth
  module Bxml
    module NestableVerb
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param tag [String] Name of the XML element.
      # @param content [String] XML element content. Defaults to nil.
      # @param nested_verbs [Array] XML element children. Defaults to an empty array.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(tag, content = nil, nested_verbs = [], attributes = {})
        @tag = tag
        @content = content
        @nested_verbs = nested_verbs
        @attributes = attributes
      end

      # Generate an XML element for the verb
      # @return [Node] The XML element.
      def generate_xml
        root = Ox::Element.new(@tag)
        if @content
          root << @content
        end

        if @nested_verbs.length > 0
          @nested_verbs.each do |verb|
            root << verb.generate_xml
          end
        end

        if !@attributes.empty? && !@attribute_map.nil?
          @attributes.each do |key, value|
            if @attribute_map.include? key.to_sym
              root[@attribute_map[key.to_sym]] = value
            else
              raise NoMethodError.new("attribute '#{key}' is not a valid attribute for this verb")
            end
          end
        end

        root
      end
    end
  end
end
