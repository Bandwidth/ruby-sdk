module Bandwidth
  module Bxml
    class Refer < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param sip_uri [SipUri] The SIP URI to REFER the call to. Uses the same SipUri verb shared with Transfer.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(sip_uri, attributes = {})
        super('Refer', nil, [sip_uri], attributes)
        @attribute_map = {
          refer_complete_url: 'referCompleteUrl',
          refer_complete_method: 'referCompleteMethod',
          tag: 'tag'
        }
      end
    end
  end
end