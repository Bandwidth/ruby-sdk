# Unit tests for Bandwidth::CreateWebRtcConnectionRequest
describe Bandwidth::CreateWebRtcConnectionRequest do
  let(:create_web_rtc_connection_request_default) { Bandwidth::CreateWebRtcConnectionRequest.new({
    type: 'WEBRTC',
    direction: 'INBOUND'
  }) }
  let(:create_web_rtc_connection_request_values) { Bandwidth::CreateWebRtcConnectionRequest.new({
    type: Bandwidth::EndpointTypeEnum::WEBRTC,
    direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL,
    event_callback_url: 'https://example.com/event-callback',
    event_fallback_url: 'https://example.com/event-fallback',
    tag: 'custom tag',
    connection_metadata: { sessionId: 'session-1' }
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateWebRtcConnectionRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateWebRtcConnectionRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateWebRtcConnectionRequest.acceptable_attributes).to eq(Bandwidth::CreateWebRtcConnectionRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateWebRtcConnectionRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateWebRtcConnectionRequest created by the build_from_hash method' do
      create_web_rtc_connection_request_from_hash = Bandwidth::CreateWebRtcConnectionRequest.build_from_hash({
        type: 'WEBRTC',
        direction: 'BIDIRECTIONAL',
        eventCallbackUrl: 'https://example.com/event-callback',
        eventFallbackUrl: 'https://example.com/event-fallback',
        tag: 'custom tag',
        connectionMetadata: { sessionId: 'session-1' }
      })
      expect(create_web_rtc_connection_request_from_hash).to be_instance_of(Bandwidth::CreateWebRtcConnectionRequest)
      expect(create_web_rtc_connection_request_from_hash.type).to eq(Bandwidth::EndpointTypeEnum::WEBRTC)
      expect(create_web_rtc_connection_request_from_hash.direction).to eq(Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL)
      expect(create_web_rtc_connection_request_from_hash.event_callback_url).to eq('https://example.com/event-callback')
      expect(create_web_rtc_connection_request_from_hash.event_fallback_url).to eq('https://example.com/event-fallback')
      expect(create_web_rtc_connection_request_from_hash.tag).to eq('custom tag')
      expect(create_web_rtc_connection_request_from_hash.connection_metadata).to eq({ sessionId: 'session-1' })
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_web_rtc_connection_request_values.to_s).to eq('{:type=>"WEBRTC", :direction=>"BIDIRECTIONAL", :eventCallbackUrl=>"https://example.com/event-callback", :eventFallbackUrl=>"https://example.com/event-fallback", :tag=>"custom tag", :connectionMetadata=>{:sessionId=>"session-1"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_web_rtc_connection_request_equal = Bandwidth::CreateWebRtcConnectionRequest.new({
        type: 'WEBRTC',
        direction: 'INBOUND'
      })
      expect(create_web_rtc_connection_request_default.eql?(create_web_rtc_connection_request_equal)).to be true
      expect(create_web_rtc_connection_request_default.eql?(create_web_rtc_connection_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_web_rtc_connection_request_values.to_body).to eq({
        type: Bandwidth::EndpointTypeEnum::WEBRTC,
        direction: Bandwidth::EndpointDirectionEnum::BIDIRECTIONAL,
        eventCallbackUrl: 'https://example.com/event-callback',
        eventFallbackUrl: 'https://example.com/event-fallback',
        tag: 'custom tag',
        connectionMetadata: { sessionId: 'session-1' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::CreateWebRtcConnectionRequest.new({ type: nil, direction: 'INBOUND' })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#direction=' do
      expect {
        Bandwidth::CreateWebRtcConnectionRequest.new({ type: 'WEBRTC', direction: nil })
      }.to raise_error(ArgumentError, 'direction cannot be nil')
    end

    it '#tag=' do
      expect {
        Bandwidth::CreateWebRtcConnectionRequest.new({ type: 'WEBRTC', direction: 'INBOUND', tag: nil })
      }.to raise_error(ArgumentError, 'tag cannot be nil')
    end
  end
end
