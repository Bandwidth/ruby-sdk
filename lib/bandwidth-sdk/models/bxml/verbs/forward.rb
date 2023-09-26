module Bandwidth
  module Bxml
    class Forward < Bandwidth::Bxml::Verb
      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super('Forward', nil, attributes)
        
        @attribute_map = {
          to: 'to',                                   # [String]: The phone number destination of the call.
          from: 'from',                               # Optional [String]: The phone number that the recipient will receive the call from.
          call_timeout: 'callTimeout',                # Optional [Number]: The number of seconds to wait before timing out the call.
          diversion_treatment: 'diversionTreatment',  # Optional [String]: Can be any of the following: - none: No diversion headers are sent on the outbound leg of the transferred call. - propagate: Copy the Diversion header from the inbound leg to the outbound leg. Ignored if there is no Diversion header present on the inbound leg. - stack: After propagating any Diversion header from the inbound leg to the outbound leg, stack on top another Diversion header based on the Request-URI of the inbound call. If diversionTreatment is not specified, no diversion header will be included for the transfer even if one came with the inbound call. Defaults to None.
          diversion_reason: 'diversionReason',        # Optional [String]: Can be any of the following values: unknown, user-busy, no-answer, unavailable, unconditional, time-of-day, do-not-disturb, deflection, follow-me, out-of-service, away. This parameter is considered only when diversionTreatment is set to stack. Defaults to None.
          uui: 'uui',                                 # Optional [String]: The value of the User-To-User header to send within the outbound INVITE when forwarding to a SIP URI. Must include the encoding parameter as specified in RFC 7433. Only base64 and jwt encoding are currently allowed. This value, including the encoding specifier, may not exceed 256 characters.
        }
      end
    end
  end
end
