require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The Bridge verb allows you to connect 2 calls 
    class Bridge
      include XmlVerb

      def to_bxml(xml)
        xml.Bridge(call_id, compact_hash({
         'bridgeCompleteUrl' => bridge_complete_url,
         'bridgeCompleteMethod' => bridge_complete_method,
         'bridgeTargetCompleteUrl' => bridge_target_complete_url,
         'bridgeTargetCompleteMethod' => bridge_target_complete_method,
         'username' => username,
         'password' => password,
         'tag' => tag
        }))
      end
    end
  end
end
