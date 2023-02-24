module Bandwidth
  module Bxml
    class Conference
      include Bandwidth::Bxml::TerminalVerb

      # Initializer
      # @param name [String] The name of the conference. Can contain up to 100 characters of letters, numbers, and the symbols -, _, and .
      def initialize(name, attributes = {})
        super("Conference", name, attributes)
        
        @attribute_map = {
          mute: 'mute',                                                       # Optional [String]: A boolean value to indicate whether the member should be on mute in the conference. When muted, a member can hear others speak, but others cannot hear them speak. Defaults to false.
          hold: 'hold',                                                       # Optional [String]: A boolean value to indicate whether the member should be on hold in the conference. When on hold, a member cannot hear others, and they cannot be heard. Defaults to false.
          call_ids_to_coach: 'callIdsToCoach',                                # Optional [String]: A comma-separated list of call ids to coach. When a call joins a conference with this attribute set, it will coach the listed calls. Those calls will be able to hear and be heard by the coach, but other calls in the conference will not hear the coach.
          conference_event_url: 'conferenceEventUrl',                         # Optional [String]: URL to send Conference events to. The URL, method, username, and password are set by the BXML document that creates the conference, and all events related to that conference will be delivered to that same endpoint. If more calls join afterwards and also have this property (or any other webhook related properties like username and password), they will be ignored and the original webhook information will be used. This URL may be a relative endpoint.
          conference_event_method: 'conferenceEventMethod',                   # Optional [String]: The HTTP method to use for the request to conferenceEventUrl. GET or POST. Default value is POST.
          conference_event_fallback_url: 'conferenceEventFallbackUrl',        # Optional [String]: A fallback url which, if provided, will be used to retry the conference webhook deliveries in case conferenceEventUrl fails to respond.
          conference_event_fallback_method: 'conferenceEventFallbackMethod',  # Optional [String]: The HTTP method to use to deliver the conference webhooks to conferenceEventFallbackUrl. GET or POST. Default value is POST.
          username: 'username',                                               # Optional [String]:The username to send in the HTTP request to conferenceEventUrl.
          password: 'password',                                               # Optional [String]: The password to send in the HTTP request to conferenceEventUrl.
          fallback_username: 'fallbackUsername',                              # Optional [String]: The username to send in the HTTP request to conferenceEventFallbackUrl.
          fallback_password: 'fallbackPassword',                              # Optional [String]: The password to send in the HTTP request to conferenceEventFallbackUrl.
          tag: 'tag',                                                         # Optional [String]: A custom string that will be sent with this and all future callbacks unless overwritten by a future tag attribute or <Tag> verb, or cleared. May be cleared by setting tag="". Max length 256 characters. Defaults to None.
          callback_timeout: 'callbackTimeout',                                # Optional [String]: This is the timeout (in seconds) to use when delivering webhooks for the conference. If not set, it will inherit the webhook timeout from the call that creates the conference. Can be any numeric value (including decimals) between 1 and 25.
        }
      end
    end
  end
end
  
