module Bandwidth
  module Bxml
    class Record < Bandwidth::Bxml::Verb
      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super('Record', nil, attributes)
        
        @attribute_map = {
          record_complete_url: 'recordCompleteUrl',                         # Optional [String]: URL to send the Record Complete event to once the recording has ended. Accepts BXML, and may be a relative URL. This callback will not be sent if the recording ended due to the call hanging up. Defaults to None.
          record_complete_method: 'recordCompleteMethod',                   # Optional [String]: The HTTP method to use for the request to recordCompleteUrl. GET or POST. Default value is POST. Defaults to None.
          record_complete_fallback_url: 'recordCompleteFallbackUrl',        # Optional [String]: A fallback url which, if provided, will be used to retry the Record Complete callback delivery in case recordCompleteUrl fails to respond. Defaults to None.
          record_complete_fallback_method: 'recordCompleteFallbackMethod',  # Optional [String]: The HTTP method to use to deliver the Record Complete callback to recordCompleteFallbackUrl. GET or POST. Default value is POST. Defaults to None.
          recording_available_url: 'recordingAvailableUrl',                 # Optional [String]: URL to send the Recording Available event to once it has been processed. Does not accept BXML. May be a relative URL. Defaults to None.
          recording_available_method: 'recordingAvailableMethod',           # Optional [String]: The HTTP method to use for the request to recordingAvailableUrl. GET or POST. Default value is POST. Defaults to None.
          transcribe: 'transcribe',                                         # Optional [Boolean]: A boolean value to indicate that recording should be transcribed. Transcription can succeed only for recordings of length greater than 500 milliseconds and less than 4 hours. Default is false. Defaults to None.
          transcription_available_url: 'transcriptionAvailableUrl',         # Optional [String]: URL to send the Transcription Available event to once it has been processed. Does not accept BXML. May be a relative URL. Defaults to None.
          transcription_available_method: 'transcriptionAvailableMethod',   # Optional [String]: The HTTP method to use for the request to transcriptionAvailableUrl. GET or POST. Default value is POST. Defaults to None.
          username: 'username',                                             # Optional [String]: The username to send in the HTTP request to recordCompleteUrl, recordingAvailableUrl or transcriptionAvailableUrl. If specified, the URLs must be TLS-encrypted (i.e., https). Defaults to None.
          password: 'password',                                             # Optional [String]: The password to send in the HTTP request to recordCompleteUrl, recordingAvailableUrl or transcriptionAvailableUrl. If specified, the URLs must be TLS-encrypted (i.e., https). Defaults to None.
          fallback_username: 'fallbackUsername',                            # Optional [String]: The username to send in the HTTP request to recordCompleteFallbackUrl. If specified, the URLs must be TLS-encrypted (i.e., https). Defaults to None.
          fallback_password: 'fallbackPassword',                            # Optional [String]: The password to send in the HTTP request to recordCompleteFallbackUrl. If specified, the URLs must be TLS-encrypted (i.e., https). Defaults to None.
          tag: 'tag',                                                       # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or <Tag> verb, or cleared. May be cleared by setting tag="". Max length 256 characters. Defaults to None.
          terminating_digits: 'terminatingDigits',                          # Optional [String]: When pressed, this digit will terminate the recording. Default value is “#”. This feature can be disabled with "". Defaults to None.
          max_duration: 'maxDuration',                                      # Optional [Number]: Maximum length of recording (in seconds). Max 10800 (3 hours). Default value is 60. Defaults to None.
          silence_timeout: 'silenceTimeout',                                # Optional [Number]: Length of silence after which to end the recording (in seconds). Max is equivalent to the maximum maxDuration value. Default value is 0, which means no timeout. Defaults to None.
          file_format: 'fileFormat',                                        # Optional [String]: The audio format that the recording will be saved as: mp3 or wav. Default value is wav. Defaults to None.
        }
      end
    end
  end
end
