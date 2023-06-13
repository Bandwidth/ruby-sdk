require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # These elements define optional user specified parameters that will be sent to the destination URL when the real-time transcription is first started
    class CustomParam
      include XmlVerb

      def to_bxml(xml)
        xml.CustomParam(compact_hash({
         'name' => name,
         'value' => value
        }))
      end
    end
  end
end
