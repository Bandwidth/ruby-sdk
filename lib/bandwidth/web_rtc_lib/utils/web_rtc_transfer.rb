# web_rtc_transfer.rb
#
# Custom transfer BXML for WebRtc
#
# @copyright Bandwidth INC

module Bandwidth
  module WebRtc
    def generate_bxml(device_token, voice_call_id, sip_uri="sip:sipx.webrtc.bandwidth.com:5060")
        return '<?xml version="1.0" encoding="UTF-8"?><Response>' + generate_transfer_bxml_verb(device_token, voice_call_id, sip_uri) + '</Response>'
    end

    def generate_transfer_bxml_verb(device_token, voice_call_id, sip_uri="sip:sipx.webrtc.bandwidth.com:5060")
        return '<Transfer><SipUri uui="%s;encoding=base64,%s;encoding=jwt">%s</SipUri></Transfer>' % [device_token, voice_call_id, sip_uri]
    end
  end
end
