require 'ox'

module Bandwidth
  module Bxml
    module Verb
      # Initializer
      # @param tag [String] Name of the XML element.
      # @param content [String] XML element content. Defaults to nil.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(tag, content = nil, attributes = {})
        @tag = tag
        @content = content
        @attributes = attributes
      end

      # Set XML attributes for the verb
      # @param attributes [Hash] The attributes to add to the element.
      def set_attributes(attributes)
        @attributes = attributes
      end

      # Generate an XML element for the verb
      # @return [Node] The XML element.
      def generate_xml
        root = Ox::Element.new(@tag)
        if @content
          root << @content
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

      # Return BXML representaion of this element
      # @return [String] The XML element in string format.
      def to_bxml
        Ox.dump(generate_xml)
      end
    end
  end
end
