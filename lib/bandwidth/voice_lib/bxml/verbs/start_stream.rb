require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StartStream verb allows a segment of a call to be sent off to another destination for additional processing
    class StartStream
      include XmlVerb

      def to_bxml(xml)
        xml.StartStream(compact_hash({
         'destination' => destination,
         'name' => name,
         'tracks' => tracks,
         'streamEventUrl' => streamEventUrl,
         'streamEventMethod' => streamEventMethod,
         'username' => username,
         'password' => password
        }))
      end
    end
  end
end
