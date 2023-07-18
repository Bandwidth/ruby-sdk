module Bandwidth
  module Bxml
    class SipUri
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param uri [String] A SIP URI to transfer the call to (e.g. sip:user@server.com)
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(uri, attributes = {})
        super('SipUri', uri, attributes)
        
        @attribute_map = {
          uui: 'uui',                                                       # Optional [String]: The value of the User-To-User header to send within the initial INVITE. Must include the encoding parameter as specified in RFC 7433. Only base64 and jwt encoding are currently allowed. This value, including the encoding specifier, may not exceed 256 characters. Defaults to None.
          transfer_answer_url: 'transferAnswerUrl',                         # Optional [String]: URL, if any, to send the Transfer Answer event to and request BXML to be executed for the called party before the call is bridged. May be a relative URL. Defaults to None.
          transfer_answer_method: 'transferAnswerMethod',                   # Optional [String]: The HTTP method to use for the request to transferAnswerUrl. GET or POST. Default value is POST. Defaults to None.
          transfer_answer_fallback_url: 'transferAnswerFallbackUrl',        # Optional [String]: A fallback url which, if provided, will be used to retry the Transfer Answer callback delivery in case transferAnswerUrl fails to respond. Defaults to None.
          transfer_answer_fallback_method: 'transferAnswerFallbackMethod',  # Optional [String]: The HTTP method to use to deliver the Transfer Answer callback to transferAnswerFallbackUrl. GET or POST. Default value is POST. Defaults to None.
          transfer_disconnect_url: 'transferDisconnectUrl',                 # Optional [String]: URL, if any, to send the Transfer Disconnect event to. This event will be sent regardless of how the transfer ends and may not be responded to with BXML. May be a relative URL. Defaults to None.
          transfer_disconnect_method: 'transferDisconnectMethod',           # Optional [String]: The HTTP method to use for the request to transferDisconnectUrl. GET or POST. Default value is POST. Defaults to Defaults to Defaults to None.
          username: 'username',                                             # Optional [String]: The username to send in the HTTP request to transferAnswerUrl and transferDisconnectUrl. Defaults to Defaults to None.
          password: 'password',                                             # Optional [String]: The password to send in the HTTP request to transferAnswerUrl and transferDisconnectUrl. Defaults to Defaults to None.
          fallback_username: 'fallbackUsername',                            # Optional [String]: The username to send in the HTTP request to transferAnswerFallbackUrl. Defaults to None.
          fallback_password: 'fallbackPassword',                            # Optional [String]: The password to send in the HTTP request to transferAnswerFallbackUrl. Defaults to None.
          tag: 'tag',                                                       # Optional [String]: A custom string that will be sent with these and all future callbacks unless overwritten by a future tag attribute or cleared. May be cleared by setting tag="" Max length 256 characters. Defaults to None.
        }
      end
    end
  end
end
