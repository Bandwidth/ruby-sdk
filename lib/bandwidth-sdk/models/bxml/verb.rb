require 'xml'

module Bandwidth
  module Bxml
    module Verb
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
        @attribute_map = []
      end

      # Set XML attributes for the verb
      # @param attributes [Hash] The attributes to add to the element.
      def set_attributes(attributes)
        @attributes = attributes
      end

      # Generate an XML element for the verb
      # @return [Node] The XML element.
      def generate_xml
        root = XML::Node.new(@tag)
        if @content
          root << @content
        end

        if @nested_verbs.length > 0
          @nested_verbs.each do |verb|
            root << verb.generate_xml
          end
        end

        if !@attributes.empty?
          @attributes.each do |key, value|
            if @attribute_map.include? key.to_s
              puts "exists"
              root[key.to_s] = value
            else
              raise NoMethodError.new("attribute '#{key}' is not a valid attribute for this verb")
            end
          end
        end

        return root
      end

      # Add a verb to the nested verbs array
      # @param nested_verbs [Verb] or [Array<Verb>] Verb or verbs to add to the array.
      def add_verb(nested_verbs)
        @nested_verbs.push(*nested_verbs)
      end

      # Return BXML representaion of this element
      # @return [String] The XML element in string format.
      def to_bxml
        return generate_xml.to_s
      end
    end
  end
end
