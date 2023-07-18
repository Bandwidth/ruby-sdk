module Bandwidth
  module Bxml
    class StartRecording
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super('StartRecording', nil, attributes)
        
        @attribute_map = {
          recording_available_url: 'recordingAvailableUrl',               # Optional [String]: URL to send the Recording Available event to once it has been processed. Does not accept BXML. May be a relative URL. Defaults to None.
          recording_available_method: 'recordingAvailableMethod',         # Optional [String]: The HTTP method to use for the request to recordingAvailableUrl. GET or POST. Default value is POST.
          transcribe: 'transcribe',                                       # Optional [Boolean]: A boolean value to indicate that recording should be transcribed. Transcription can succeed only for recordings of length greater than 500 milliseconds and less than 4 hours. Default is false. Defaults to None.
          transcription_available_url: 'transcriptionAvailableUrl',       # Optional [String]: URL to send the Transcription Available event to once it has been processed. Does not accept BXML. May be a relative URL. Defaults to None.
          transcription_available_method: 'transcriptionAvailableMethod', # Optional [String]: The HTTP method to use for the request to transcriptionAvailableUrl. GET or POST. Default value is POST. Defaults to None.
          username: 'username',                                           # Optional [String]: The username to send in the HTTP request to recordingAvailableUrl or transcriptionAvailableUrl. If specified, the URLs must be TLS-encrypted (i.e., https). Defaults to None.
          password: 'password',                                           # Optional [String]: The password to send in the HTTP request to recordingAvailableUrl or transcriptionAvailableUrl. If specified, the URLs must be TLS-encrypted (i.e., https). Defaults to None.
          tag: 'tag',                                                     # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or <Tag> verb, or cleared. May be cleared by setting tag="". Max length 256 characters. Defaults to None.
          file_format: 'fileFormat',                                      # Optional [String]: The audio format that the recording will be saved as: mp3 or wav. Default value is wav.
          multi_channel: 'multiChannel',                                  # Optional [Boolean]: A boolean value indicating whether or not the recording file should separate each side of the call into its own audio channel. Default value is false.
        }
      end
    end
  end
end
