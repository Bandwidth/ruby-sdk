require_relative 'xml_verb'

module Bandwidth
  module Voice
    # The Record verb is used to trigger call recording
    class Record
      include XmlVerb

      def to_bxml(xml)
        xml.Record(compact_hash({
         'tag' => tag,
         'username' => username,
         'password' => password,
         'recordCompleteUrl' => record_complete_url,
         'recordCompleteMethod' => record_complete_method,
         'recordingAvailableUrl' => recording_available_url,
         'recordingAvailableMethod' => recording_available_method,
         'terminatingDigits' => terminating_digits,
         'maxDuration' => max_duration,
         'fileFormat' => file_format,
         'transcribe' => transcribe,
         'detectLanguage' => detect_language,
         'transcriptionAvailableUrl' => transcription_available_url,
         'transcriptionAvailableMethod' => transcription_available_method,
         'silenceTimeout' => silence_timeout,
         'recordCompleteFallbackUrl' => record_complete_fallback_url,
         'recordCompleteFallbackMethod' => record_complete_fallback_method,
         'fallbackUsername' => fallback_username,
         'fallbackPassword' => fallback_password
        }))
      end
    end
  end
end
