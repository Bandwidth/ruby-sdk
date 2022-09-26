require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class Tag
      include XmlVerb

      def to_bxml(xml)
        xml.Tag(tag)
      end
    end
  end
end
