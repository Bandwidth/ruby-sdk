module Bandwidth
  module Bxml
    class Refer < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param sip_uri [SipUri] or [Array<SipUri>] XML element children. Defaults to an empty array. Valid nested verb is: SipUri.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(sip_uri = [], attributes = {})
        super('Refer', nil, sip_uri, attributes)

        @attribute_map = {
          refer_complete_url: 'referCompleteUrl',        # Optional [String]: URL to send the Refer Complete event to and request new BXML. May be a relative URL.
          refer_complete_method: 'referCompleteMethod',  # Optional [String]: The HTTP method to use for the request to referCompleteUrl. GET or POST. Default value is POST.
          tag: 'tag',                                    # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or cleared. May be cleared by setting tag="" Max length 256 characters.
        }
      end

      # Add SipUri to the nested verbs array
      # @param sip_uri [SipUri] or [Array<SipUri>] Verb or verbs to add to the array.
      def add_sip_uri(sip_uri)
        @nested_verbs.push(*sip_uri)
      end
    end
  end
end

