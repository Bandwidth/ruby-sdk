require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class SipUri
      include XmlVerb
      def to_bxml(xml)
        xml.SipUri(uri, compact_hash({
          'transferAnswerUrl' => transfer_answer_url,
          'transferAnswerMethod' => transfer_answer_method,
          'transferDisconnectUrl' => transfer_disconnect_url,
          'transferDisconnectMethod' => transfer_disconnect_method,
          'username' => username,
          'password' => password,
          'tag' => tag,
          'uui' => uui,
          'transferAnswerFallbackUrl' => transfer_answer_fallback_url,
          'transferAnswerFallbackMethod' => transfer_answer_fallback_method,
          'fallbackUsername' => fallback_username,
          'fallbackPassword' => fallback_password
        }))
      end
    end
  end
end
