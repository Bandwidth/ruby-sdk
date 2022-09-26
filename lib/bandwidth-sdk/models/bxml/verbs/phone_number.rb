require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    class PhoneNumber
      include XmlVerb
      def to_bxml(xml)
        xml.PhoneNumber(number, compact_hash({
          'transferAnswerUrl' => transfer_answer_url,
          'transferAnswerMethod' => transfer_answer_method,
          'transferDisconnectUrl' => transfer_disconnect_url,
          'transferDisconnectMethod' => transfer_disconnect_method,
          'username' => username,
          'password' => password,
          'tag' => tag,
          'transferAnswerFallbackUrl' => transfer_answer_fallback_url,
          'transferAnswerFallbackMethod' => transfer_answer_fallback_method,
          'fallbackUsername' => fallback_username,
          'fallbackPassword' => fallback_password
        }))
      end
    end
  end
end
