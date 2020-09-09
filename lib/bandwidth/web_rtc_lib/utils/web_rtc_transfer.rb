# web_rtc_transfer.rb
#
# Custom transfer BXML for WebRtc
#
# @copyright Bandwidth INC

module Bandwidth
  module WebRtc
    def generate_bxml(device_token, sip_uri="sip:sipx.webrtc.bandwidth.com:5060")
        return '<?xml version="1.0" encoding="UTF-8"?><Transfer><SipUri uui="%s;encoding=jwt">%s</SipUri></Transfer>' % [device_token, sip_uri]
    end
  end
end
