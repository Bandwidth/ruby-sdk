module Bandwidth
  module Bxml
    class Refer < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param sip_uri [SipUri] The SIP URI to REFER the call to. Uses the same SipUri verb shared with Transfer. Defaults to an empty array.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(sip_uri = [], attributes = {})
        super('Refer', nil, sip_uri, attributes)

        @attribute_map = {
          refer_complete_url: 'referCompleteUrl',        # Optional [String]: URL to send the Refer Complete event to and request new BXML for failure recovery. May be a relative URL. Defaults to None.
          refer_complete_method: 'referCompleteMethod',   # Optional [String]: The HTTP method to use for the request to referCompleteUrl. GET or POST. Default value is POST. Defaults to None.
          tag: 'tag',                                     # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or cleared. May be cleared by setting tag="". Max length 256 characters. Defaults to None.
        }
      end

      # Set the SIP URI destination for this Refer verb
      # @param sip_uri [SipUri] The SIP URI to refer the call to.
      def set_sip_uri(sip_uri)
        @nested_verbs = [sip_uri]
      end
    end
  end
end
