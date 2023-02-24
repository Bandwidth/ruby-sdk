require 'libxml'

module Bandwidth
  module Bxml
    module Root
      # Initializer
      # @param tag [String] Name of the XML element.
      # @param nested_verbs [Array<Verb>] XML element children. Defaults to an empty array.
      def initialize(tag, nested_verbs = [])
        @tag = tag
        @nested_verbs = nested_verbs
      end

      # Generate an XML element for the BXML response
      # @return [Document] The XML element.
      def generate_xml
        xml = LibXML::XML::Document.new
        xml.root = LibXML::XML::Node.new(@tag)
        @nested_verbs.each do |verb|
          xml.root << verb.generate_xml
        end
        return xml
        # xml.target!().gsub(SPEAK_SENTENCE_REGEX){|s|s.gsub(SSML_REGEX, '<\1>')}
      end

      # Add a verb to the nested verbs array
      # @param *nested_verbs [Verb] or [Array<Verb>] Verb or verbs to add to the array.
      def add_verb(nested_verbs)
        @nested_verbs.push(*nested_verbs)
      end

      # Return BXML representaion of this response
      # @return [String] The XML response in string format.
      def to_bxml
        return generate_xml.to_s
      end
    end
  end
end
