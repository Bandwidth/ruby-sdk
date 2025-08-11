module Bandwidth
  module Bxml
    class StartStream < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param stream_params [Verb] or [Array<Verb>] XML element children. Defaults to an empty array. Valid nested stream params are: StreamParam. You may specify up to 12 <StreamParam/> elements nested within a <StartStream> tag.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(stream_params = [], attributes = {})
        super('StartStream', nil, stream_params, attributes)
        
        @attribute_map = {
          name: 'name',                                 # Optional [String]: A name to refer to this stream by. Used when sending <StopStream>. If not provided, it will default to the generated stream id as sent in the Media Stream Started webhook.
          mode: 'mode',                                 # Optional [String]: The mode to use for the stream. unidirectional or bidirectional. Specifies whether the audio being streamed over the WebSocket is bidirectional (the service can both read and write audio over the WebSocket) or unidirectional (one-way, read-only). Default is unidirectional.
          tracks: 'tracks',                             # Optional [String]: The part of the call to send a stream from. inbound, outbound or both. Default is inbound.
          destination: 'destination',                   # Optional [String]: A websocket URI to send the stream to. The audio from the specified tracks will be sent via websocket to this URL as base64-encoded PCMU/G711 audio.
          destination_username: 'destination_username', # Optional [String]: The username to send in the `Authorization` header of the initial websocket connection to the `destination` URL.
          destination_password: 'destination_password', # Optional [String]: The password to send in the `Authorization` header of the initial websocket connection to the `destination` URL.
          stream_event_url: 'streamEventUrl',           # Optional [String]: URL to send the associated Webhook events to during this stream's lifetime. Does not accept BXML. May be a relative URL.
          stream_event_method: 'streamEventMethod',     # Optional [String]: The HTTP method to use for the request to streamEventUrl. GET or POST. Default value is POST.
          username: 'username',                         # Optional [String]: The username to send in the HTTP request to streamEventUrl. If specified, the URLs must be TLS-encrypted (i.e., https).
          password: 'password',                         # Optional [String]: The password to send in the HTTP request to streamEventUrl. If specified, the URLs must be TLS-encrypted (i.e., https).
        }
      end

      # Add stream param or params to the nested verbs array
      # @param stream_params [StreamParam] or [Array<StreamParam>] Verb or verbs to add to the array.
      def add_stream_params(stream_params)
        @nested_verbs.push(*stream_params)
      end
    end
  end
end
