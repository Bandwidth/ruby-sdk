module Bandwidth
  module Bxml
    class StartGather
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super('StartGather', nil, attributes)
        
        @attribute_map = {
          dtmf_url: 'dtmfUrl',        # [String]: URL to send the DTMF event to. May be a relative URL.
          dtmf_method: 'dtmfMethod',  # Optional [String]: The HTTP method to use for the request to dtmfUrl. GET or POST. Default value is POST.
          username: 'username',       # Optional [String]: The username to send in the HTTP request to dtmfUrl. Defaults to None.
          password: 'password',       # Optional [String]: The password to send in the HTTP request to dtmfUrl. Defaults to None.
          tag: 'tag',                 # Optional [String]: A custom string that will be sent with these and all future callbacks unless overwritten by a future tag attribute or cleared. May be cleared by setting tag="" Max length 256 characters. Defaults to None.
        }
      end
    end
  end
end
