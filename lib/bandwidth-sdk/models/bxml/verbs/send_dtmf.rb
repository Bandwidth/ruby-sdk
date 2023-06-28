module Bandwidth
  module Bxml
    class SendDtmf
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param digits [String] String containing the DTMF characters to be sent in a call. Allows a maximum of 50 characters. The digits will be sent one-by-one with a marginal delay.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(digits, attributes = {})
        super('SendDtmf', digits, attributes)
        
        @attribute_map = {
          tone_duration: 'toneDuration',  # Optional [Number]: The length (in milliseconds) of each DTMF tone. Default value is 200. Range: decimal values between 50 - 5000.
          tone_interval: 'toneInterval',  # Optional [Number]: The duration of silence (in milliseconds) following each DTMF tone. Default value is 400. Range: decimal values between 50 - 5000.
        }
      end
    end
  end
end
