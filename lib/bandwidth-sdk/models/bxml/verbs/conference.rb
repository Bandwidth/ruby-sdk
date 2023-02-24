module Bandwidth
  module Bxml
    class Conference
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      # @param name [String] The name of the conference. Can contain up to 100 characters of letters, numbers, and the symbols -, _, and .
      def initialize(name, attributes = {})
        super("Conference", target_call, attributes)
        
        @attribute_map = [
            
        ]
      end
    end
  end
end
  
