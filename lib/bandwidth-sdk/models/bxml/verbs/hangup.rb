require_relative 'xml_verb'

module Bandwidth 
  module Voice  
    # The Hangup verb is used to hangup current call
    class Hangup
      include XmlVerb

      def to_bxml(xml)
        xml.Hangup()
      end
    end
  end
end
