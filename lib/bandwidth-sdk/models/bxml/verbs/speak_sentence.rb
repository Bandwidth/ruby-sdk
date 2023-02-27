module Bandwidth
  module Bxml
    class SpeakSentence
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      # @param text [String] The text to speak. Cannot be blank. Can be a mixture of plain text and SSML tags.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(text, attributes = {})
        super("SpeakSentence", text, attributes)
        
        @attribute_map = {
          voice: 'voice',   # Optional [String]: Selects the voice of the speaker. If the voice attribute is present, gender and locale are ignored. You can find a list of supported voices here: https://dev.bandwidth.com/docs/voice/bxml/speakSentence/#supported-voices
          gender: 'gender', # Optional [String]: Selects the gender of the speaker. Valid values are "male" or "female". Default "female".
          locale: 'locale', # Optional [String]: Selects the locale of the speaker. Default "en_US"
        }
      end

      # Return BXML representaion of this response
      # @return [String] The XML response in string format.
      def to_bxml
        bxml = Ox.dump(generate_xml)
        return bxml.gsub(SPEAK_SENTENCE_REGEX) { |text| text.gsub(SSML_REGEX, '<\1>')}
      end
    end
  end
end
