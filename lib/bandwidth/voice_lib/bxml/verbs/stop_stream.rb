require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StopStream verb is used to stop a stream that was started with a previous `<StartStream>` verb
    class StopStream
      include XmlVerb

      def to_bxml(xml)
        xml.StopStream(compact_hash({
         'name' => name
        }))
      end
    end
  end
end
