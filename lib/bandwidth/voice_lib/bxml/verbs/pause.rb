require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class Pause
      include XmlVerb

      def to_bxml(xml)
        xml.Pause(compact_hash({
         'duration' => duration
      }))
      end
    end
  end
end
