require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StopTranscription verb is used to stop a real-time transcription that was started with a previous `<StartTranscription>` verb
    class StopTranscription
      include XmlVerb

      def to_bxml(xml)
        xml.StopTranscription(compact_hash({
         'name' => name
        }))
      end
    end
  end
end
