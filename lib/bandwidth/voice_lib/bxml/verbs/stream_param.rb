require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StartStream verb allows a segment of a call to be sent off to another destination for additional processing
    class StreamParam
      include XmlVerb

      def to_bxml(xml)
        xml.StreamParam(compact_hash({
         'name' => name,
         'value' => value
        }))
      end
    end
  end
end
