module Bandwidth
  module Bxml
    class Transfer < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param transfer_to [Verb] or [Array<Verb>] XML element children. Defaults to an empty array. Valid nested transfer verbs are: PhoneNumber, SipUri.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(transfer_to = [], attributes = {})
        super('Transfer', nil, transfer_to, attributes)
        
        @attribute_map = {
          transfer_caller_id: 'transferCallerId',                               # Optional [String]: The caller ID to use when the call is transferred, if different. Must be in E.164 format (e.g. +15555555555) or be one of the following strings Restricted, Anonymous, Private, or Unavailable. Leave as default to pass along the number of the remote party. Defaults to None.
          call_timeout: 'callTimeout',                                          # Optional [Number]:The timeout (in seconds) for the callee to answer the call after it starts ringing. If the call does not start ringing within 30s, the call will be cancelled regardless of this value. Range: decimal values between 1 - 300. Default value is 30 seconds. Defaults to None.
          transfer_complete_url: 'transferCompleteUrl',                         # Optional [String]: URL to send the Transfer Complete event to and request new BXML. Optional but recommended. See below for further details. May be a relative URL. Defaults to None.
          transfer_complete_method: 'transferCompleteMethod',                   # Optional [String]: The HTTP method to use for the request to transferCompleteUrl. GET or POST. Default value is POST. Defaults to None.
          transfer_complete_fallback_url: 'transferCompleteFallbackUrl',        # Optional [String]: A fallback url which, if provided, will be used to retry the Transfer Complete callback delivery in case transferCompleteUrl fails to respond. Defaults to None.
          transfer_complete_fallback_method: 'transferCompleteFallbackMethod',  # Optional [String]: The HTTP method to use to deliver the Transfer Complete callback to transferCompleteFallbackUrl. GET or POST. Default value is POST. Defaults to None.
          username: 'username',                                                 # Optional [String]: The username to send in the HTTP request to transferCompleteUrl. Defaults to None.
          password: 'password',                                                 # Optional [String]: The password to send in the HTTP request to transferCompleteUrl. Defaults to None.
          fallback_username: 'fallbackUsername',                                # Optional [String]: The username to send in the HTTP request to transferCompleteFallbackUrl. Defaults to None.
          fallback_password: 'fallbackPassword',                                # Optional [String]: The password to send in the HTTP request to transferCompleteFallbackUrl. Defaults to None.
          tag: 'tag',                                                           # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or cleared. May be cleared by setting tag="" Max length 256 characters. Defaults to None.
          diversion_treatment: 'diversionTreatment',                            # Optional [String]: Can be any of the following: - none: No diversion headers are sent on the outbound leg of the transferred call. - propagate: Copy the Diversion header from the inbound leg to the outbound leg. Ignored if there is no Diversion header present on the inbound leg. - stack: After propagating any Diversion header from the inbound leg to the outbound leg, stack on top another Diversion header based on the Request-URI of the inbound call. If diversionTreatment is not specified, no diversion header will be included for the transfer even if one came with the inbound call. Defaults to None.
          diversion_reason: 'diversionReason',                                  # Optional [String]: Can be any of the following values: unknown, user-busy, no-answer, unavailable, unconditional, time-of-day, do-not-disturb, deflection, follow-me, out-of-service, away. This parameter is considered only when diversionTreatment is set to stack. Defaults to None.
        }
      end

      # Add transfer recipient or recipients to the nested verbs array
      # @param recipients [PhoneNumber] or [SipUri] or [Array<PhoneNumber || SipUri>] Verb or verbs to add to the array.
      def add_transfer_recipients(recipients)
        @nested_verbs.push(*recipients)
      end
    end
  end
end
