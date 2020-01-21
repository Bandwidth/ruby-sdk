require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The PlayAudio verb is used to play an audio file in the call
    class PlayAudio
      include XmlVerb

      def to_bxml(xml)
        xml.PlayAudio(url, compact_hash({
         'username' => username,
         'password' => password
        }))
      end
    end
  end
end
