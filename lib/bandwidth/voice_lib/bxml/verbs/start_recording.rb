require_relative 'xml_verb'

module Bandwidth
  module Voice
    # The StartRecording verb is used to trigger call recording
    class StartRecording
      include XmlVerb

      def to_bxml(xml)
        xml.StartRecording(compact_hash({
         'tag' => tag,
         'username' => username,
         'password' => password,
         'recordingAvailableUrl' => recording_available_url,
         'recordingAvailableMethod' => recording_available_method,
         'fileFormat' => file_format,
         'multiChannel' => multi_channel,
         'transcribe' => transcribe,
         'detectLanguage' => detect_language,
         'transcriptionAvailableUrl' => transcription_available_url,
         'transcriptionAvailableMethod' => transcription_available_method
        }))
      end
    end
  end
end
