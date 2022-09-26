require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StartGather verb is used to start a gather 
    class StartGather
      include XmlVerb

      def to_bxml(xml)
        xml.StartGather(compact_hash({
          'username' => username,
          'password' => password,
          'tag' => tag,
          'dtmfUrl' => dtmf_url,
          'dtmfMethod' => dtmf_method,
         }))
      end
    end
  end
end
