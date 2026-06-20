module Bandwidth
  module Bxml
    class Refer < Bandwidth::Bxml::NestableVerb
      def initialize(sip_uri, attributes = {})
        super('Refer', nil, [sip_uri], attributes)
        @attribute_map = {
          refer_complete_url: 'referCompleteUrl',
          refer_complete_method: 'referCompleteMethod',
          tag: 'tag'
        }
      end
    end
  end
end