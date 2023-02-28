module Bandwidth
  module Bxml
    class Redirect
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(attributes = {})
        super("Redirect", nil, attributes)
        
        @attribute_map = {
          redirect_url: 'redirectUrl',                        # [String]: URL to request new BXML from. A Redirect event will be sent to this endpoint. May be a relative URL. Defaults to None.
          redirect_method: 'redirectMethod',                  # Optional [String]: The HTTP method to use for the request to redirectUrl. GET or POST. Defaults to None.
          redirect_fallback_url: 'redirectFallbackUrl',       # Optional [String]: A fallback url which, if provided, will be used to retry the Redirect callback delivery in case redirectUrl fails to respond. Defaults to None.
          redirect_fallback_method: 'redirectFallbackMethod', # Optional [String]: The HTTP method to use to deliver the Redirect callback to redirectFallbackUrl. GET or POST. Default value is POST. Defaults to None.
          username: 'username',                               # Optional [String]: The username to send in the HTTP request to redirectUrl. Defaults to None.
          password: 'password',                               # Optional [String]: The password to send in the HTTP request to redirectUrl. Defaults to None.
          fallback_username: 'fallbackUsername',              # Optional [String]: The username to send in the HTTP request to redirectFallbackUrl. Defaults to None.
          fallback_password: 'fallbackPassword',              # Optional [String]: The password to send in the HTTP request to redirectFallbackUrl. Defaults to None.
          tag: 'tag',                                         # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or <Tag> verb, or cleared. May be cleared by setting tag="". Max length 256 characters. Defaults to None.
        }
      end
    end
  end
end
