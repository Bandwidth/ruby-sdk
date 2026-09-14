module Bandwidth
  module Bxml
    class Connect < Bandwidth::Bxml::NestableVerb
      # Initializer
      # @param endpoints [Verb] or [Array<Verb>] XML element children. Defaults to an empty array. Valid nested connect verbs are: Endpoint.
      # @param attributes [Hash] The attributes to add to the element. Defaults to an empty hash.
      def initialize(endpoints = [], attributes = {})
        super('Connect', nil, endpoints, attributes)

        @attribute_map = {
          event_callback_url: 'eventCallbackUrl',  # Optional [String]: URL to send events to during the connection lifecycle. May be a relative URL. Defaults to None.
        }
      end

      # Add endpoint or endpoints to the nested verbs array
      # @param endpoints [Endpoint] or [Array<Endpoint>] Verb or verbs to add to the array.
      def add_endpoints(endpoints)
        @nested_verbs.push(*endpoints)
      end
    end
  end
end
