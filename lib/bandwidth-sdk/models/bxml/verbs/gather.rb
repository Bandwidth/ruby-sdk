module Bandwidth
  module Bxml
    class Gather < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param audio_verbs [Verb] or [Array<Verb>] XML element children. Defaults to an empty array. Valid nested audio verbs are: SpeakSentence, PlayAudio.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(audio_verbs = [], attributes = {})
        super('Gather', nil, audio_verbs, attributes)

        @attribute_map = {
          gather_url: 'gatherUrl',                        # Optional [String]: URL to send Gather event to and request new BXML. May be a relative URL.
          gather_method: 'gatherMethod',                  # Optional [String]: The HTTP method to use for the request to gather_url. GET or POST. Default value is POST.
          gather_fallback_url: 'gatherFallbackUrl',       # Optional [String]: A fallback url which, if provided, will be used to retry the Gather event callback delivery in case gather_url fails to respond.
          gather_fallback_method: 'gatherFallbackMethod', # Optional [String]: The HTTP method to use to deliver the Gather event callback to gather_fallback_url. GET or POST. Default value is POST.
          username: 'username',                           # Optional [String]: The username to send in the HTTP request to gather_url.
          password: 'password',                           # Optional [String]: The password to send in the HTTP request to gather_url.
          fallback_username: 'fallbackUsername',          # Optional [String]: The username to send in the HTTP request to gather_fallback_url.
          fallback_password: 'fallbackPassword',          # Optional [String]: The password to send in the HTTP request to gather_fallback_url.
          tag: 'tag',                                     # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or <Tag> verb, or cleared. May be cleared by setting tag="". Max length 256 characters.
          terminating_digits: 'terminatingDigits',        # Optional [String]: When any of these digits are pressed, it will terminate the Gather. Default value is "", which disables this feature.
          max_digits: 'maxDigits',                        # Optional [Number]: Max number of digits to collect. Default value is 50. Range: decimal values between 1 - 50.
          inter_digit_timeout: 'interDigitTimeout',       # Optional [Number]: Time (in seconds) allowed between digit presses before automatically terminating the Gather. Default value is 5. Range: decimal values between 1 - 60.
          first_digit_timeout: 'firstDigitTimeout',       # Optional [Number]: Time (in seconds) to pause after any audio from nested <SpeakSentence> or <PlayAudio> verb is played (in seconds) before terminating the Gather. Default value is 5. Range: decimal values between 0 - 60.
          repeat_count: 'repeatCount',                    # Optional [Number]: The number of times the audio prompt should be played if no digits are pressed. For example, if this value is 3, the nested audio clip will be played a maximum of three times. The delay between repetitions will be equal to first_digit_timeout. Default value is 1. repeatCount * number of verbs must not be greater than 20.
        }
      end

      # Return BXML representaion of this response
      # @return [String] The XML response in string format.
      def to_bxml
        bxml = Ox.dump(generate_xml)
        bxml.gsub(SPEAK_SENTENCE_REGEX) { |text| text.gsub(SSML_REGEX, '<\1>') }
      end

      # Add audio verb or verbs to the nested verbs array
      # @param audio_verbs [SpeakSentence] or [PlayAudio] or [Array<SpeakSentence || PlayAudio>] Verb or verbs to add to the array.
      def add_audio_verbs(audio_verbs)
        @nested_verbs.push(*audio_verbs)
      end
    end
  end
end
