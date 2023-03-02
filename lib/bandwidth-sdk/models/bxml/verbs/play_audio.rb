module Bandwidth
  module Bxml
    class PlayAudio
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param audio_uri [String] The URL of the audio file to play. May be a relative URL.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(audio_uri, attributes = {})
        super("PlayAudio", audio_uri, attributes)
        
        @attribute_map = {
          username: 'username', # Optional [String]: The username to send in the HTTP request to audio_uri.
          password: 'password', # Optional [String]: The password to send in the HTTP request to audio_uri.
        }
      end
    end
  end
end
