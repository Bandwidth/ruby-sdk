module Bandwidth
  module Bxml
    class Conference
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      # @param target_call [String] String containing the callId of the call to be bridged.
      def initialize(target_call, attributes = {})
        super("Bridge", target_call, attributes)
        
        @attribute_map = [
            
        ]
      end
    end
  end
end
  
