require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StartTranscription verb allows a segment of a call to be transcribed and optionally for the live transcription to be sent off to another destination for additional processing
    class StartTranscription
      include XmlVerb

      def to_bxml(xml)
        xml.StartTranscription(compact_hash({
         'name' => name,
         'tracks' => tracks,
         'transcriptionEventUrl' => transcriptionEventUrl,
         'transcriptionEventMethod' => transcriptionEventMethod,
         'username' => username,
         'password' => password,
         'destination' => destination,
         'stabilized' => stabilized
        })) do
          def embedded_xml(xml, property, type)
            if property
              s = if property.is_a?(type)
                    then property
                  else type.new(property)
                    end
              s.to_bxml(xml)
            end
          end
          def nest_verbs_list(xml, property)
            if property
              property.each do |verb|
                verb.to_bxml(xml)
              end
            end
          end
         embedded_xml(xml, custom_params, CustomParam)
         nest_verbs_list(xml, nested_verbs)
        end
      end
    end
  end
end
