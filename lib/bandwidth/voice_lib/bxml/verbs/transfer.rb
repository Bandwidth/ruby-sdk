require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The Transfer verb is used to transfer the call to another number
    class Transfer
      include XmlVerb

      def to_bxml(xml)
        xml.Transfer(compact_hash({
         'transferCallerId' => transfer_caller_id,
         'callTimeout' => call_timeout,
         'tag' => tag,
         'transferCompleteUrl' => transfer_complete_url,
         'transferCompleteMethod' => transfer_complete_method,
         'username' => username,
         'password' => password,
         'diversionTreatment' => diversion_treatment,
         'diversionReason' => diversion_reason
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
          phone_numbers.each do |number|
            embedded_xml(xml, number, PhoneNumber)
          end
        end
      end
    end
  end
end
