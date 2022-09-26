require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class Forward
      include XmlVerb
      def to_bxml(xml)
        xml.Forward(compact_hash({
         'to' => to,
         'from' => from,
         'callTimeout' => call_timeout,
         'diversionTreatment' => diversion_treatment,
         'diversionReason' => diversion_reason
        }))
      end
    end
  end
end
