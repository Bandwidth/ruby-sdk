require_relative 'xml_verb'

module Bandwidth 
  module Voice 
    # The Conference verb is used to add callees to conferences 
    class Conference
      include XmlVerb

      def to_bxml(xml)
        if not call_ids_to_coach.nil?
          coach_ids = call_ids_to_coach.instance_of?(String) ? call_ids_to_coach : call_ids_to_coach.join(",")
        else
          coach_ids = nil
        end
        xml.Conference(conference_name, compact_hash({
         'mute' => mute,
         'hold' => hold,
         'callIdsToCoach' => coach_ids,
         'conferenceEventUrl' => conference_event_url,
         'conferenceEventMethod' => conference_event_method,
         'username' => username,
         'password' => password,
         'tag' => tag,
         'conferenceEventFallbackUrl' => conference_event_fallback_url,
         'conferenceEventFallbackMethod' => conference_event_fallback_method,
         'fallbackUsername' => fallback_username,
         'fallbackPassword' => fallback_password
        }))
      end
    end
  end
end
