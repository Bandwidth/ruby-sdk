require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The Redirect verb is used to redirect the current XML execution to another URL
    class Redirect
      include XmlVerb

      def to_bxml(xml)
        xml.Redirect(compact_hash({
         'redirectUrl' => redirect_url,
         'redirectMethod' => redirect_method,
         'tag' => tag,
         'username' => username,
         'password' => password,
         'redirectFallbackUrl' => redirect_fallback_url,
         'redirectFallbackMethod' => redirect_fallback_method,
         'fallbackUsername' => fallback_username,
         'fallbackPassword' => fallback_password
        }))
      end
    end
  end
end
