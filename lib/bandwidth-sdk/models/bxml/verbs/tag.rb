module Bandwidth
  module Bxml
    class Tag
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      # @param content [String] Custom tag value. Defaults to nil.
      def initialize(content = nil)
        super("Tag", content, {})
      end
    end
  end
end
