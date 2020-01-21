require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class SendDtmf
      include XmlVerb

      def to_bxml(xml)
        xml.SendDtmf(dtmf)
      end
    end
  end
end
