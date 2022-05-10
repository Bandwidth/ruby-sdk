require 'builder'
Dir[File.dirname(__FILE__) + '/verbs/*'].each {|file|
  require_relative file
}

SSML_REGEX = /&lt;([a-zA-Z\/\/].*?)&gt;/
SPEAK_SENTENCE_REGEX = /<SpeakSentence.*?>.*?<\/SpeakSentence>/

module Bandwidth 
  module Voice 
    class Response
      # Initializer
      # @param verbs [Array] optional list of verbs to include into response
      def initialize(verbs = nil)
        @verbs = verbs || []
      end

      # Return BXML representaion of this response
      def to_bxml()
        xml = Builder::XmlMarkup.new()
        xml.instruct!(:xml, :version=>'1.0', :encoding=>'UTF-8')
        xml.Response do
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
