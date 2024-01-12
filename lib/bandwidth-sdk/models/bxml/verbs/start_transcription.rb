module Bandwidth
  module Bxml
    class StartTranscription < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param custom_params [Verb] or [Array<Verb>] XML element children. Defaults to an empty array. Valid nested custom params are: CustomParam. You may specify up to 12 <CustomParam/> elements nested within a <StartTranscription> tag.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(custom_params = [], attributes = {})
        super('StartTranscription', nil, custom_params, attributes)
        
        @attribute_map = {
          name: 'name',                                           # Optional [String]: A name to refer to this transcription by. Used when sending <StopTranscription>. If not provided, it will default to the generated transcription id as sent in the Real-Time Transcription Started webhook.
          tracks: 'tracks',                                       # Optional [String]: The part of the call to send a transcription from. inbound, outbound or both. Default is inbound.
          transcription_event_url: 'transcriptionEventUrl',       # Optional [String]: URL to send the associated Webhook events to during this real-time transcription's lifetime. Does not accept BXML. May be a relative URL.
          transcription_event_method: 'transcriptionEventMethod', # Optional [String]: The HTTP method to use for the request to transcriptionEventUrl. GET or POST. Default value is POST.
          username: 'username',                                   # Optional [String]: The username to send in the HTTP request to transcriptionEventUrl. If specified, the transcriptionEventUrl must be TLS-encrypted (i.e., https).
          password: 'password',                                   # Optional [String]: The password to send in the HTTP request to transcriptionEventUrl. If specified, the transcriptionEventUrl must be TLS-encrypted (i.e., https).
          destination: 'destination',                             # Optional [String]: A websocket URI to send the transcription to. A transcription of the specified tracks will be sent via websocket to this URL as a series of JSON messages. See below for more details on the websocket packet format.
          stabilized: 'stabilized',                               # Optional [Boolean]: Whether to send transcription update events to the specified destination only after they have become stable. Requires destination. Defaults to true.
        }
      end

      # Add custom param or params to the nested verbs array
      # @param custom_params [CustomParam] or [Array<CustomParam>] Verb or verbs to add to the array.
      def add_custom_params(custom_params)
        @nested_verbs.push(*custom_params)
      end
    end
  end
end
