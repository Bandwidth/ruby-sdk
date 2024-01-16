module Bandwidth
  module Bxml
    class Response < Bandwidth::Bxml::Root
      # Initializer
      # @param nested_verbs [Verb] or [Array<Verb>] XML element children. Defaults to an empty array.
      def initialize(nested_verbs = [])
        super(tag = 'Response', nested_verbs)
      end
    end
  end
end
