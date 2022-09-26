require_relative 'xml_verb'

module Bandwidth 
  module Voice  
    # The StopRecording verb is used to stop recording in a call 
    class StopRecording
      include XmlVerb

      def to_bxml(xml)
        xml.StopRecording()
      end
    end
  end
end
