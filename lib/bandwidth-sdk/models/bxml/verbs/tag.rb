module Bandwidth
  module Bxml
    class Tag
      include Bandwidth::Bxml::Verb

      # Initializer
      # @param content [String] Custom tag value. Defaults to nil.
      def initialize(content = nil)
        super("Tag", content, {})
      end
    end
  end
end
