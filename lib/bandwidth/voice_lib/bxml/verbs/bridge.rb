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
         'tag' => tag,
         'bridgeCompleteFallbackUrl' => bridge_complete_fallback_url,
         'bridgeCompleteFallbackMethod' => bridge_complete_fallback_method,
         'bridgeTargetCompleteFallbackUrl' => bridge_target_complete_fallback_url,
         'bridgeTargetCompleteFallbackMethod' => bridge_target_complete_fallback_method,
         'fallbackUsername' => fallback_username,
         'fallbackPassword' => fallback_password
        }))
      end
    end
  end
end
