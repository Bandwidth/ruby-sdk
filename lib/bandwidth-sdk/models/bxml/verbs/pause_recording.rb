require_relative 'xml_verb'

module Bandwidth 
  module Voice  
    # The PauseRecording verb is used to pause recording in a call 
    class PauseRecording
      include XmlVerb

      def to_bxml(xml)
        xml.PauseRecording()
      end
    end
  end
end
