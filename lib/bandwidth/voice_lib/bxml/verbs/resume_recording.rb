require_relative 'xml_verb'

module Bandwidth 
  module Voice  
    # The ResumeRecording verb is used to resume recording in a call 
    class ResumeRecording
      include XmlVerb

      def to_bxml(xml)
        xml.ResumeRecording()
      end
    end
  end
end
