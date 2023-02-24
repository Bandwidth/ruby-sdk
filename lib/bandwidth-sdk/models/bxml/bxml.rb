require 'xml'

module Bandwidth
  module Bxml
    class Bxml
      include Bandwidth::Bxml::Root

      # Initializer
      # @param nested_verbs [Array<Verb>] XML element children. Defaults to an empty array.
      def initialize(nested_verbs = [])
        super(tag='Bxml', nested_verbs)
      end
    end
  end
end
