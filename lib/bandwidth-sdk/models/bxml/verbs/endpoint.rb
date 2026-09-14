module Bandwidth
  module Bxml
    class Endpoint < Bandwidth::Bxml::Verb
      # Initializer
      # @param endpoint_id [String] The ID of the endpoint to connect to.
      def initialize(endpoint_id)
        super('Endpoint', endpoint_id, {})
      end
    end
  end
end
