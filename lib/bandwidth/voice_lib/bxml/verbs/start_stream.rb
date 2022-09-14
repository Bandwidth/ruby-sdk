require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The StartStream verb allows a segment of a call to be sent off to another destination for additional processing
    class StartStream
      include XmlVerb

      def to_bxml(xml)
        xml.StartStream(compact_hash({
         'destination' => destination,
         'name' => name,
         'tracks' => tracks,
         'streamEventUrl' => streamEventUrl,
         'streamEventMethod' => streamEventMethod,
         'username' => username,
         'password' => password
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
         embedded_xml(xml, stream_params, StreamParam)
         nest_verbs_list(xml, nested_verbs)
        end
      end
    end
  end
end
