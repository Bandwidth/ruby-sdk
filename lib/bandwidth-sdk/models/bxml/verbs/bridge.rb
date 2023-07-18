module Bandwidth
  module Bxml
    class Bridge
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param target_call [String] The callId of the call to be bridged.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(target_call, attributes = {})
        super('Bridge', target_call, attributes)
        
        @attribute_map = {
          bridge_complete_url: 'bridgeCompleteUrl',                                     # Optional [String]: URL to send the Bridge Complete event to and request new BXML. If this attribute is specified, then Verbs following the <Bridge> verb will be ignored and the BXML returned in this webhook is executed on the call. If this attribute is not specified then no webhook will be sent, and execution of the verbs following the <Bridge> verb continues. May be a relative URL. Defaults to None.
          bridge_complete_method: 'bridgeCompleteMethod',                               # Optional [String]: The HTTP method to use for the request to bridgeCompleteUrl. GET or POST. Default value is POST.
          bridge_complete_fallback_url: 'bridgeCompleteFallbackUrl',                    # Optional [String]: A fallback url which, if provided, will be used to retry the Bridge Complete webhook delivery in case bridgeCompleteUrl fails to respond. Defaults to None.
          bridge_complete_fallback_method: 'bridgeCompleteFallbackMethod',              # Optional [String]: The HTTP method to use to deliver the Bridge Complete webhook to bridgeCompleteFallbackUrl. GET or POST. Default value is POST.
          bridge_target_complete_url: 'bridgeTargetCompleteUrl',                        # Optional [String]: URL to send the Bridge Target Complete event to and request new BXML. If this attribute is specified, then the BXML returned in this webhook is executed on the target call. If this attribute is not specified then no webhook will be sent, and the target call will be hung up. May be a relative URL. Defaults to None.
          bridge_target_complete_method: 'bridgeTargetCompleteMethod',                  # Optional [String]: The HTTP method to use for the request to bridgeTargetCompleteUrl. GET or POST. Default value is POST.
          bridge_target_complete_fallback_url: 'bridgeTargetCompleteFallbackUrl',       # Optional [String]: A fallback url which, if provided, will be used to retry the Bridge Target Complete webhook delivery in case bridgeTargetCompleteUrl fails to respond. Defaults to None.
          bridge_target_complete_fallback_method: 'bridgeTargetCompleteFallbackMethod', # Optional [String]: The HTTP method to use to deliver the Bridge Target Complete webhook to bridgeTargetCompleteFallbackUrl. GET or POST. Default value is POST.
          username: 'username',                                                         # Optional [String]: The username to send in the HTTP request to bridgeCompleteUrl and to bridgeTargetCompleteUrl. Defaults to None.
          password: 'password',                                                         # Optional [String]: The password to send in the HTTP request to bridgeCompleteUrl and to bridgeTargetCompleteUrl. Defaults to None.
          fallback_username: 'fallbackUsername',                                        # Optional [String]: The username to send in the HTTP request to bridgeCompleteFallbackUrl and to bridgeTargetCompleteFallbackUrl. Defaults to None.
          fallback_password: 'fallbackPassword',                                        # Optional [String]: The password to send in the HTTP request to bridgeCompleteFallbackUrl and to bridgeTargetCompleteFallbackUrl. Defaults to None.
          tag: 'tag',                                                                   # Optional [String]: A custom string that will be sent with the bridgeComplete webhook and all future webhooks of the call unless overwritten by a future tag attribute or <Tag> verb, or cleared. May be cleared by setting tag="". Max length 256 characters. Defaults to None.
        }
      end
    end
  end
end
