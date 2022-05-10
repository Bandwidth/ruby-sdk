require 'builder'
Dir[File.dirname(__FILE__) + '/verbs/*'].each {|file|
  require_relative file
}

module Bandwidth 
  module Voice 
    class Bxml
      # Initializer
      # @param verbs [Array] optional list of verbs to include in the bxml tag
      def initialize(verbs = nil)
        @verbs = verbs || []
      end

      # Return BXML representaion of this response
      def to_bxml()
        xml = Builder::XmlMarkup.new()
        xml.instruct!(:xml, :version=>'1.0', :encoding=>'UTF-8')
        xml.Bxml do
          @verbs.each {|verb| verb.to_bxml(xml)}
        end
        xml.target!().gsub(SPEAK_SENTENCE_REGEX){|s|s.gsub(SSML_REGEX, '<\1>')}
      end

      # Add one or more verbs to this response
      def push(*verbs)
        @verbs.push(*verbs)
      end

      # Add a verb to this response
      def <<(verb)
        @verbs << verb
      end
    end
  end
end
