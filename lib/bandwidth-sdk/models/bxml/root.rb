require 'ox'

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
        xml = Ox::Document.new
        instruct = Ox::Instruct.new(:xml)
        instruct[:version] = '1.0'
        instruct[:encoding] = 'UTF-8'
        xml << instruct
        root = Ox::Element.new(@tag)
        @nested_verbs.each do |verb|
          root << verb.generate_xml
        end
        xml << root
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
        return Ox.dump(generate_xml)
      end
    end
  end
end
