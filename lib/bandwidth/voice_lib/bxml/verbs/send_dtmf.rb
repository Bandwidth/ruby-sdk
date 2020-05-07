require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class SendDtmf
      include XmlVerb

      def to_bxml(xml)
        xml.SendDtmf(dtmf, compact_hash({
            'toneDuration' => tone_duration,
            'toneInterval' => tone_interval
        }))
      end
    end
  end
end
