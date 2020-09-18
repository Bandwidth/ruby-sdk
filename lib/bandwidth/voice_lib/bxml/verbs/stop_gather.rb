require_relative 'xml_verb'

module Bandwidth 
  module Voice  
    # The StopGather verb is used to complete a gather
    class StopGather
      include XmlVerb

      def to_bxml(xml)
        xml.StopGather()
      end
    end
  end
end
